import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../domain/auction.dart';

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
}
