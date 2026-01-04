import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/api_client.dart';
import '../network/api_constants.dart';

/// Location-based search service for nearby products and auctions
/// Implements OLX-level location filtering with Haversine distance calculation
class LocationBasedSearchService {
  final ApiClient _apiClient;

  LocationBasedSearchService(this._apiClient);

  /// Search for nearby products within a specified radius
  /// 
  /// Parameters:
  /// - [latitude]: User's current latitude (-90 to 90)
  /// - [longitude]: User's current longitude (-180 to 180)
  /// - [radius]: Search radius in kilometers (default: 50, max: 100)
  /// - [limit]: Maximum results (default: 20, max: 100)
  /// - [page]: Page number for pagination (default: 1)
  /// - [categoryId]: Optional category filter
  /// - [condition]: Optional condition filter (new, used, refurbished)
  /// - [minPrice]: Optional minimum price filter
  /// - [maxPrice]: Optional maximum price filter
  Future<Map<String, dynamic>> searchNearbyProducts({
    required double latitude,
    required double longitude,
    double radius = 50.0,
    int limit = 20,
    int page = 1,
    String? categoryId,
    String? condition,
    double? minPrice,
    double? maxPrice,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
        'radius': radius,
        'limit': limit,
        'page': page,
        if (categoryId != null) 'category_id': categoryId,
        if (condition != null) 'condition': condition,
        if (minPrice != null) 'min_price': minPrice,
        if (maxPrice != null) 'max_price': maxPrice,
      };

      print('🗺️ LOCATION_SEARCH: Searching nearby products at ($latitude, $longitude) within ${radius}km');

      final response = await _apiClient.get(
        '/sell/nearby',
        queryParameters: queryParams,
      );

      if (response.data['success'] == true) {
        print('🗺️ LOCATION_SEARCH: Found ${response.data['data']['products']?.length ?? 0} nearby products');
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Failed to search nearby products');
      }
    } catch (e) {
      print('🗺️ LOCATION_SEARCH: Error searching nearby products: $e');
      rethrow;
    }
  }

  /// Get location-aware product recommendations
  /// 
  /// Returns products in three zones:
  /// - Nearby: Within 10km
  /// - Local: Within 50km
  /// - Regional: Within 100km
  Future<Map<String, dynamic>> getLocationRecommendations({
    required double latitude,
    required double longitude,
    int limit = 20,
    String? categoryId,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
        'limit': limit,
        if (categoryId != null) 'category_id': categoryId,
      };

      print('🗺️ LOCATION_SEARCH: Getting recommendations for ($latitude, $longitude)');

      final response = await _apiClient.get(
        '/sell/recommendations',
        queryParameters: queryParams,
      );

      if (response.data['success'] == true) {
        final data = response.data['data'];
        print('🗺️ LOCATION_SEARCH: Recommendations - Nearby: ${data['nearby']?.length ?? 0}, Local: ${data['local']?.length ?? 0}, Regional: ${data['regional']?.length ?? 0}');
        return data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to get recommendations');
      }
    } catch (e) {
      print('🗺️ LOCATION_SEARCH: Error getting recommendations: $e');
      rethrow;
    }
  }

  /// Search nearby auctions within a radius
  Future<Map<String, dynamic>> searchNearbyAuctions({
    required double latitude,
    required double longitude,
    double radius = 50.0,
    int limit = 20,
    int page = 1,
    String? categoryId,
    String? status,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
        'radius': radius,
        'limit': limit,
        'page': page,
        if (categoryId != null) 'category_id': categoryId,
        if (status != null) 'status': status,
      };

      print('🗺️ LOCATION_SEARCH: Searching nearby auctions at ($latitude, $longitude) within ${radius}km');

      final response = await _apiClient.get(
        '/auctions/nearby',
        queryParameters: queryParams,
      );

      if (response.data['success'] == true) {
        print('🗺️ LOCATION_SEARCH: Found ${response.data['data']['auctions']?.length ?? 0} nearby auctions');
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Failed to search nearby auctions');
      }
    } catch (e) {
      print('🗺️ LOCATION_SEARCH: Error searching nearby auctions: $e');
      rethrow;
    }
  }

  /// Calculate distance between two coordinates using Haversine formula
  /// Returns distance in kilometers
  double calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    const double earthRadius = 6371; // Earth's radius in kilometers
    
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    
    final a = 
      _sin(dLat / 2) * _sin(dLat / 2) +
      _cos(_toRadians(lat1)) * _cos(_toRadians(lat2)) *
      _sin(dLon / 2) * _sin(dLon / 2);
    
    final c = 2 * _atan2(_sqrt(a), _sqrt(1 - a));
    
    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * (3.141592653589793 / 180.0);
  double _sin(double x) => x - (x * x * x) / 6 + (x * x * x * x * x) / 120;
  double _cos(double x) => 1 - (x * x) / 2 + (x * x * x * x) / 24;
  double _sqrt(double x) {
    if (x == 0) return 0;
    double z = x;
    for (int i = 0; i < 10; i++) {
      z = (z + x / z) / 2;
    }
    return z;
  }
  double _atan2(double y, double x) {
    if (x > 0) return _atan(y / x);
    if (x < 0 && y >= 0) return _atan(y / x) + 3.141592653589793;
    if (x < 0 && y < 0) return _atan(y / x) - 3.141592653589793;
    if (x == 0 && y > 0) return 3.141592653589793 / 2;
    if (x == 0 && y < 0) return -3.141592653589793 / 2;
    return 0;
  }
  double _atan(double x) {
    return x - (x * x * x) / 3 + (x * x * x * x * x) / 5 - (x * x * x * x * x * x * x) / 7;
  }
}

/// Riverpod provider for location-based search service
final locationBasedSearchServiceProvider = Provider<LocationBasedSearchService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return LocationBasedSearchService(apiClient);
});

/// Provider for nearby products search
final nearbyProductsProvider = FutureProvider.family<Map<String, dynamic>, NearbySearchParams>(
  (ref, params) async {
    final service = ref.watch(locationBasedSearchServiceProvider);
    return await service.searchNearbyProducts(
      latitude: params.latitude,
      longitude: params.longitude,
      radius: params.radius,
      limit: params.limit,
      page: params.page,
      categoryId: params.categoryId,
      condition: params.condition,
      minPrice: params.minPrice,
      maxPrice: params.maxPrice,
    );
  },
);

/// Provider for location recommendations
final locationRecommendationsProvider = FutureProvider.family<Map<String, dynamic>, LocationParams>(
  (ref, params) async {
    final service = ref.watch(locationBasedSearchServiceProvider);
    return await service.getLocationRecommendations(
      latitude: params.latitude,
      longitude: params.longitude,
      limit: params.limit,
      categoryId: params.categoryId,
    );
  },
);

/// Parameters for nearby search
class NearbySearchParams {
  final double latitude;
  final double longitude;
  final double radius;
  final int limit;
  final int page;
  final String? categoryId;
  final String? condition;
  final double? minPrice;
  final double? maxPrice;

  NearbySearchParams({
    required this.latitude,
    required this.longitude,
    this.radius = 50.0,
    this.limit = 20,
    this.page = 1,
    this.categoryId,
    this.condition,
    this.minPrice,
    this.maxPrice,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NearbySearchParams &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          radius == other.radius &&
          limit == other.limit &&
          page == other.page &&
          categoryId == other.categoryId &&
          condition == other.condition &&
          minPrice == other.minPrice &&
          maxPrice == other.maxPrice;

  @override
  int get hashCode =>
      latitude.hashCode ^
      longitude.hashCode ^
      radius.hashCode ^
      limit.hashCode ^
      page.hashCode ^
      (categoryId?.hashCode ?? 0) ^
      (condition?.hashCode ?? 0) ^
      (minPrice?.hashCode ?? 0) ^
      (maxPrice?.hashCode ?? 0);
}

/// Parameters for location-based recommendations
class LocationParams {
  final double latitude;
  final double longitude;
  final int limit;
  final String? categoryId;

  LocationParams({
    required this.latitude,
    required this.longitude,
    this.limit = 20,
    this.categoryId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationParams &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          limit == other.limit &&
          categoryId == other.categoryId;

  @override
  int get hashCode =>
      latitude.hashCode ^
      longitude.hashCode ^
      limit.hashCode ^
      (categoryId?.hashCode ?? 0);
}
