import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_constants.dart';
import '../domain/auction.dart';

class AuctionService {
  final ApiClient _apiClient;

  AuctionService(this._apiClient);

  /// Get all live auctions with pagination and filters
  Future<Map<String, dynamic>> getAllAuctions({
    int page = 1,
    int limit = 20,
    String? status,
    String? categoryId,
    String? sellerId,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        if (status != null) 'status': status,
        if (categoryId != null) 'category_id': categoryId,
        if (sellerId != null) 'seller_id': sellerId,
      };

      final response = await _apiClient.get(
        '/auctions',
        queryParameters: queryParams,
      );

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch auctions');
      }
    } catch (e) {
      print('Error fetching auctions: $e');
      rethrow;
    }
  }

  /// Get user's own auctions
  Future<Map<String, dynamic>> getMyAuctions({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        '/auctions/my-auctions',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch my auctions');
      }
    } catch (e) {
      print('Error fetching my auctions: $e');
      rethrow;
    }
  }

  /// Get auction by ID
  Future<Auction> getAuctionById(String auctionId) async {
    try {
      final response = await _apiClient.get('/auctions/$auctionId');

      if (response.data['success'] == true) {
        return Auction.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch auction');
      }
    } catch (e) {
      print('Error fetching auction $auctionId: $e');
      rethrow;
    }
  }

  /// Search auctions by attributes
  Future<Map<String, dynamic>> searchAuctions({
    required String query,
    int page = 1,
    int limit = 20,
    String? status = 'active', // Default to active auctions only
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'query': query,
        'page': page,
        'limit': limit,
        if (status != null) 'status': status,
      };

      final response = await _apiClient.get(
        '/auctions/search/attributes',
        queryParameters: queryParams,
      );

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to search auctions');
      }
    } catch (e) {
      print('Error searching auctions: $e');
      rethrow;
    }
  }

  /// Update auction
  Future<Auction> updateAuction(String auctionId, Map<String, dynamic> updates) async {
    try {
      final response = await _apiClient.put(
        '/auctions/$auctionId',
        data: updates,
      );

      if (response.data['success'] == true) {
        return Auction.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to update auction');
      }
    } catch (e) {
      print('Error updating auction $auctionId: $e');
      rethrow;
    }
  }

  /// Delete auction
  Future<void> deleteAuction(String auctionId) async {
    try {
      final response = await _apiClient.delete('/auctions/$auctionId');

      if (response.data['success'] != true) {
        throw Exception(response.data['message'] ?? 'Failed to delete auction');
      }
    } catch (e) {
      print('Error deleting auction $auctionId: $e');
      rethrow;
    }
  }

  /// Clone auction
  Future<Auction> cloneAuction(
    String auctionId,
    Map<String, dynamic> modifications,
  ) async {
    try {
      final response = await _apiClient.post(
        '/auctions/$auctionId/clone',
        data: modifications,
      );

      if (response.data['success'] == true) {
        return Auction.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to clone auction');
      }
    } catch (e) {
      print('Error cloning auction $auctionId: $e');
      rethrow;
    }
  }

  /// Get auction statistics
  Future<Map<String, dynamic>> getAuctionStatistics() async {
    try {
      final response = await _apiClient.get('/auctions/stats/overview');

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch statistics');
      }
    } catch (e) {
      print('Error fetching auction statistics: $e');
      rethrow;
    }
  }

  /// Bulk update auction status (Admin only)
  Future<Map<String, dynamic>> bulkUpdateStatus(
    List<String> auctionIds,
    String status,
  ) async {
    try {
      final response = await _apiClient.patch(
        '/auctions/bulk-status',
        data: {
          'auction_ids': auctionIds,
          'status': status,
        },
      );

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to bulk update');
      }
    } catch (e) {
      print('Error bulk updating auctions: $e');
      rethrow;
    }
  }
}