import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../domain/auction.dart';
import '../domain/watchlist_item.dart';

final auctionRepositoryProvider = Provider<AuctionRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuctionRepository(apiClient);
});

class AuctionRepository {
  final ApiClient _apiClient;

  AuctionRepository(this._apiClient);

  Future<List<Auction>> getAuctions({
    int page = 1,
    int limit = 20,
    String? categoryId,
    String? search,
    String? status,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'limit': limit,
        if (categoryId != null) 'category_id': categoryId,
        if (search != null) 'q': search,
        if (status != null) 'status': status,
      };

      final response = await _apiClient.get(
        '${ApiConstants.auctions}/search', // Using search endpoint for advanced filtering
        queryParameters: queryParams,
      );

      if (response.data['success'] == true) {
        final List<dynamic> data = response.data['data']['auctions'];
        return data.map((json) => Auction.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch auctions');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Auction> getAuctionById(String auctionId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.auctions}/$auctionId',
      );

      if (response.data['success'] == true) {
        return Auction.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch auction');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Map<String, dynamic>> createAuction({
    required String title,
    required String description,
    required double startPrice,
    double? reservePrice,
    required String categoryId,
    required DateTime startTime,
    required DateTime endTime,
    required String type,
    required List<String> images,
    List<String> tags = const [],
    Map<String, dynamic> dynamicFields = const {},
  }) async {
    try {
      final requestBody = {
        'title': title,
        'description': description,
        'start_price': startPrice,
        if (reservePrice != null) 'reserve_price': reservePrice,
        'category_id': categoryId,
        'start_time': startTime.toIso8601String(),
        'end_time': endTime.toIso8601String(),
        'type': type,
        'images': images,
        if (tags.isNotEmpty) 'tags': tags,
        if (dynamicFields.isNotEmpty) 'dynamic_fields': dynamicFields,
      };

      final response = await _apiClient.post(
        ApiConstants.auctions,
        data: requestBody,
      );

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Failed to create auction');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<List<WatchlistItem>> getWatchlist({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'limit': limit,
      };

      final response = await _apiClient.get(
        ApiConstants.watchlist,
        queryParameters: queryParams,
      );

      if (response.data['success'] == true) {
        final List<dynamic> data = response.data['data']['watchlist'];
        return data.map((json) => WatchlistItem.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch watchlist');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<void> addToWatchlist(String auctionId) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.watchlist,
        data: {'auction_id': auctionId},
      );

      if (response.data['success'] != true) {
        throw Exception(response.data['message'] ?? 'Failed to add to watchlist');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<void> removeFromWatchlist(String auctionId) async {
    try {
      final response = await _apiClient.delete(
        '${ApiConstants.watchlist}/$auctionId',
      );

      if (response.data['success'] != true) {
        throw Exception(response.data['message'] ?? 'Failed to remove from watchlist');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
