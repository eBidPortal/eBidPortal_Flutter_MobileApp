import '../../../core/network/api_client.dart';
import '../../auction/domain/auction.dart';
import '../../product/domain/product.dart';
import '../../catalog/domain/category.dart';

class HomeService {
  final ApiClient _apiClient;

  HomeService(this._apiClient);



  /// Get featured products (Direct Buy items)
  Future<List<Product>> getFeaturedProducts({int limit = 5}) async {
    try {
      final response = await _apiClient.get(
        '/sell', // Assuming this is the public endpoint for listing sell items
        queryParameters: {
          'limit': limit,
          'featured': true, // Try to get featured items
          // If public API doesn't support 'featured', it might just ignore this or return all.
          // Fallback to sort by date if needed
          'sort': 'created_at_desc',
        },
      );

      if (response.data['success'] == true) {
        final data = response.data['data'] as Map<String, dynamic>;
        final productsList = data['products'] as List;
        print('🏠 HOME_SERVICE: Featured products - Total: ${data['total']}, Products count: ${productsList.length}');
        return productsList.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        // If the API returns success=false, we just return empty list for this section
        print('🏠 HOME_SERVICE: Featured products endpoint returned success=false: ${response.data['message']}');
        return [];
      }
    } catch (e) {
      print('🏠 HOME_SERVICE: Error fetching featured products (ignoring to keep home safe): $e');
      // Gracefully return empty list so the rest of the home page still loads
      return [];
    }
  }

  /// Get featured auctions (auctions with high bids or recent activity)
  Future<List<Auction>> getFeaturedAuctions({int limit = 5}) async {
    try {
      final response = await _apiClient.get(
        '/auctions',
        queryParameters: {
          'limit': limit,
          'sort': 'current_price_desc', // Get highest priced auctions
        },
      );

      if (response.data['success'] == true) {
        final data = response.data['data'] as Map<String, dynamic>;
        final auctionsList = data['auctions'] as List;
        print('🏠 HOME_SERVICE: Featured auctions - Total: ${data['total']}, Auctions count: ${auctionsList.length}');
        return auctionsList.map((json) => Auction.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch featured auctions');
      }
    } catch (e) {
      print('Error fetching featured auctions: $e');
      rethrow;
    }
  }

  /// Get auctions ending soon (within next 24 hours)
  Future<List<Auction>> getEndingSoonAuctions({int limit = 4}) async {
    try {
      final now = DateTime.now();
      final tomorrow = now.add(const Duration(hours: 24));

      final response = await _apiClient.get(
        '/auctions',
        queryParameters: {
          'end_time_before': tomorrow.toIso8601String(),
          'limit': limit,
          'sort': 'end_time_asc', // Soonest ending first
        },
      );

      if (response.data['success'] == true) {
        final data = response.data['data'] as Map<String, dynamic>;
        final auctionsList = data['auctions'] as List;
        print('🏠 HOME_SERVICE: Ending soon auctions - Total: ${data['total']}, Auctions count: ${auctionsList.length}');
        return auctionsList.map((json) => Auction.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch ending soon auctions');
      }
    } catch (e) {
      print('Error fetching ending soon auctions: $e');
      rethrow;
    }
  }

  /// Get trending categories (categories with most active auctions)
  Future<List<Category>> getTrendingCategories({int limit = 6}) async {
    try {
      // First get all categories
      final categoriesResponse = await _apiClient.get(
        '/catalog/categories',
        queryParameters: {'tree': true},
      );

      if (categoriesResponse.data['success'] == true) {
        final categoriesList = categoriesResponse.data['data'] as List;
        final allCategories = categoriesList.map((json) => Category.fromJson(json as Map<String, dynamic>)).toList();

        // For now, return first 6 categories (in a real implementation, you'd sort by auction count)
        // TODO: Implement proper trending logic based on auction activity
        return allCategories.take(limit).toList();
      } else {
        throw Exception(categoriesResponse.data['message'] ?? 'Failed to fetch categories');
      }
    } catch (e) {
      print('Error fetching trending categories: $e');
      rethrow;
    }
  }

  /// Get home statistics (total auctions, active users, etc.)
  Future<Map<String, dynamic>> getHomeStats() async {
    try {
      final response = await _apiClient.get('/auctions/stats/overview');

      if (response.data['success'] == true) {
        return response.data['data'] as Map<String, dynamic>;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch home stats');
      }
    } catch (e) {
      print('Error fetching home stats: $e');
      // Return default stats if API fails
      return {
        'total_auctions': 0,
        'active_auctions': 0,
        'total_bids': 0,
        'active_users': 0,
      };
    }
  }

  /// Search auctions (for the search bar)
  Future<List<Auction>> searchAuctions(String query, {int limit = 10}) async {
    try {
      final response = await _apiClient.get(
        '/auctions/search/attributes',
        queryParameters: {
          'query': query,
          'limit': limit,
        },
      );

      if (response.data['success'] == true) {
        final data = response.data['data'] as Map<String, dynamic>;
        final auctionsList = data['auctions'] as List;
        return auctionsList.map((json) => Auction.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to search auctions');
      }
    } catch (e) {
      print('Error searching auctions: $e');
      rethrow;
    }
  }

  /// Get nearby products based on location
  Future<List<Product>> getNearbyProducts({
    required double latitude,
    required double longitude,
    double radius = 50,
    int limit = 5,
  }) async {
    try {
      final response = await _apiClient.get(
        '/sell/nearby',
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'radius': radius,
          'limit': limit,
        },
      );

      if (response.data['success'] == true) {
        final data = response.data['data'] as Map<String, dynamic>;
        final productsList = data['products'] as List;
        print('🏠 HOME_SERVICE: Nearby products - Count: ${productsList.length}');
        return productsList.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch nearby products');
      }
    } catch (e) {
      print('Error fetching nearby products: $e');
      rethrow;
    }
  }
}