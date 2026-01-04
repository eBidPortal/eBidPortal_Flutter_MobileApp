import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/api_client.dart';

/// Analytics service for tracking user behavior and app insights
/// Integrates with backend analytics endpoints
class AnalyticsService {
  final ApiClient _apiClient;

  AnalyticsService(this._apiClient);

  // ==================== EVENT TRACKING ====================

  /// Track a custom analytics event
  Future<void> trackEvent({
    required String eventName,
    required String eventType,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      await _apiClient.post(
        '/analytics/events',
        data: {
          'event_name': eventName,
          'event_type': eventType,
          'metadata': metadata ?? {},
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      print('📊 ANALYTICS: Event tracked - $eventName ($eventType)');
    } catch (e) {
      print('📊 ANALYTICS: Error tracking event: $e');
    }
  }

  /// Track screen view
  Future<void> trackScreenView(String screenName) async {
    await trackEvent(
      eventName: 'screen_view',
      eventType: 'navigation',
      metadata: {
        'screen_name': screenName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Track auction view
  Future<void> trackAuctionView(String auctionId, String auctionTitle) async {
    await trackEvent(
      eventName: 'auction_view',
      eventType: 'engagement',
      metadata: {
        'auction_id': auctionId,
        'auction_title': auctionTitle,
      },
    );
  }

  /// Track product view
  Future<void> trackProductView(String productId, String productTitle) async {
    await trackEvent(
      eventName: 'product_view',
      eventType: 'engagement',
      metadata: {
        'product_id': productId,
        'product_title': productTitle,
      },
    );
  }

  /// Track search query
  Future<void> trackSearch(String query, int resultsCount) async {
    await trackEvent(
      eventName: 'search',
      eventType: 'search',
      metadata: {
        'query': query,
        'results_count': resultsCount,
      },
    );
  }

  /// Track bid placement
  Future<void> trackBidPlacement({
    required String auctionId,
    required double bidAmount,
    required double previousBid,
  }) async {
    await trackEvent(
      eventName: 'bid_placed',
      eventType: 'transaction',
      metadata: {
        'auction_id': auctionId,
        'bid_amount': bidAmount,
        'previous_bid': previousBid,
        'bid_increment': bidAmount - previousBid,
      },
    );
  }

  /// Track watchlist action
  Future<void> trackWatchlistAction({
    required String action, // 'add' or 'remove'
    required String itemId,
    required String itemType, // 'auction' or 'product'
  }) async {
    await trackEvent(
      eventName: 'watchlist_$action',
      eventType: 'engagement',
      metadata: {
        'item_id': itemId,
        'item_type': itemType,
        'action': action,
      },
    );
  }

  /// Track share action
  Future<void> trackShare({
    required String itemId,
    required String itemType,
    required String shareMethod, // 'whatsapp', 'facebook', 'copy_link', etc.
  }) async {
    await trackEvent(
      eventName: 'share',
      eventType: 'social',
      metadata: {
        'item_id': itemId,
        'item_type': itemType,
        'share_method': shareMethod,
      },
    );
  }

  /// Track filter usage
  Future<void> trackFilterUsage(Map<String, dynamic> filters) async {
    await trackEvent(
      eventName: 'filter_applied',
      eventType: 'search',
      metadata: filters,
    );
  }

  /// Track location search
  Future<void> trackLocationSearch({
    required double latitude,
    required double longitude,
    required double radius,
    required int resultsCount,
  }) async {
    await trackEvent(
      eventName: 'location_search',
      eventType: 'search',
      metadata: {
        'latitude': latitude,
        'longitude': longitude,
        'radius': radius,
        'results_count': resultsCount,
      },
    );
  }

  // ==================== USER ANALYTICS ====================

  /// Get user analytics dashboard
  Future<Map<String, dynamic>> getUserAnalytics() async {
    try {
      final response = await _apiClient.get('/analytics/user/dashboard');
      
      if (response.data['success'] == true) {
        print('📊 ANALYTICS: User analytics retrieved');
        return response.data['data'];
      } else {
        throw Exception('Failed to get user analytics');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting user analytics: $e');
      rethrow;
    }
  }

  /// Get user activity summary
  Future<Map<String, dynamic>> getUserActivitySummary({
    String period = '30d', // '7d', '30d', '90d', '1y'
  }) async {
    try {
      final response = await _apiClient.get(
        '/analytics/user/activity',
        queryParameters: {'period': period},
      );
      
      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get activity summary');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting activity summary: $e');
      rethrow;
    }
  }

  /// Get bidding statistics
  Future<Map<String, dynamic>> getBiddingStats() async {
    try {
      final response = await _apiClient.get('/analytics/user/bidding-stats');
      
      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get bidding stats');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting bidding stats: $e');
      rethrow;
    }
  }

  /// Get watchlist analytics
  Future<Map<String, dynamic>> getWatchlistAnalytics() async {
    try {
      final response = await _apiClient.get('/analytics/user/watchlist');
      
      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get watchlist analytics');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting watchlist analytics: $e');
      rethrow;
    }
  }

  // ==================== AUCTION ANALYTICS ====================

  /// Get auction performance metrics
  Future<Map<String, dynamic>> getAuctionAnalytics(String auctionId) async {
    try {
      final response = await _apiClient.get('/analytics/auctions/$auctionId');
      
      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get auction analytics');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting auction analytics: $e');
      rethrow;
    }
  }

  /// Get trending auctions
  Future<List<Map<String, dynamic>>> getTrendingAuctions({
    String timeWindow = '24h', // '1h', '6h', '24h', '7d'
    int limit = 10,
  }) async {
    try {
      final response = await _apiClient.get(
        '/analytics/auctions/trending',
        queryParameters: {
          'time_window': timeWindow,
          'limit': limit,
        },
      );
      
      if (response.data['success'] == true) {
        final data = response.data['data']['auctions'] as List;
        return data.map((e) => Map<String, dynamic>.from(e)).toList();
      } else {
        throw Exception('Failed to get trending auctions');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting trending auctions: $e');
      rethrow;
    }
  }

  /// Get auction activity feed
  Future<Map<String, dynamic>> getAuctionActivityFeed({
    String? auctionId,
    int limit = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'limit': limit,
        if (auctionId != null) 'auction_id': auctionId,
      };

      final response = await _apiClient.get(
        '/analytics/activity-feed',
        queryParameters: queryParams,
      );
      
      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get activity feed');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting activity feed: $e');
      rethrow;
    }
  }

  // ==================== CATEGORY ANALYTICS ====================

  /// Get category performance
  Future<Map<String, dynamic>> getCategoryAnalytics(String categoryId) async {
    try {
      final response = await _apiClient.get('/analytics/categories/$categoryId');
      
      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get category analytics');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting category analytics: $e');
      rethrow;
    }
  }

  /// Get popular categories
  Future<List<Map<String, dynamic>>> getPopularCategories({
    String period = '30d',
    int limit = 10,
  }) async {
    try {
      final response = await _apiClient.get(
        '/analytics/categories/popular',
        queryParameters: {
          'period': period,
          'limit': limit,
        },
      );
      
      if (response.data['success'] == true) {
        final data = response.data['data']['categories'] as List;
        return data.map((e) => Map<String, dynamic>.from(e)).toList();
      } else {
        throw Exception('Failed to get popular categories');
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting popular categories: $e');
      rethrow;
    }
  }

  // ==================== SEARCH ANALYTICS ====================

  /// Get search suggestions based on analytics
  Future<List<String>> getSearchSuggestions(String query) async {
    try {
      final response = await _apiClient.get(
        '/analytics/search/suggestions',
        queryParameters: {'query': query},
      );
      
      if (response.data['success'] == true) {
        final suggestions = response.data['data']['suggestions'] as List;
        return suggestions.map((e) => e.toString()).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting search suggestions: $e');
      return [];
    }
  }

  /// Get popular searches
  Future<List<String>> getPopularSearches({int limit = 10}) async {
    try {
      final response = await _apiClient.get(
        '/analytics/search/popular',
        queryParameters: {'limit': limit},
      );
      
      if (response.data['success'] == true) {
        final searches = response.data['data']['searches'] as List;
        return searches.map((e) => e.toString()).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('📊 ANALYTICS: Error getting popular searches: $e');
      return [];
    }
  }

  // ==================== PERFORMANCE METRICS ====================

  /// Track app performance metrics
  Future<void> trackPerformanceMetric({
    required String metricName,
    required double value,
    String? unit,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      await _apiClient.post(
        '/analytics/performance',
        data: {
          'metric_name': metricName,
          'value': value,
          'unit': unit,
          'metadata': metadata ?? {},
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      print('📊 ANALYTICS: Performance metric tracked - $metricName: $value${unit ?? ''}');
    } catch (e) {
      print('📊 ANALYTICS: Error tracking performance: $e');
    }
  }

  /// Track API response time
  Future<void> trackAPIResponseTime(String endpoint, int milliseconds) async {
    await trackPerformanceMetric(
      metricName: 'api_response_time',
      value: milliseconds.toDouble(),
      unit: 'ms',
      metadata: {'endpoint': endpoint},
    );
  }

  /// Track screen load time
  Future<void> trackScreenLoadTime(String screenName, int milliseconds) async {
    await trackPerformanceMetric(
      metricName: 'screen_load_time',
      value: milliseconds.toDouble(),
      unit: 'ms',
      metadata: {'screen_name': screenName},
    );
  }

  // ==================== CONVERSION TRACKING ====================

  /// Track conversion funnel step
  Future<void> trackFunnelStep({
    required String funnelName,
    required String stepName,
    required int stepNumber,
    Map<String, dynamic>? metadata,
  }) async {
    await trackEvent(
      eventName: 'funnel_step',
      eventType: 'conversion',
      metadata: {
        'funnel_name': funnelName,
        'step_name': stepName,
        'step_number': stepNumber,
        ...?metadata,
      },
    );
  }

  /// Track conversion completion
  Future<void> trackConversion({
    required String conversionType,
    required String conversionId,
    double? value,
    Map<String, dynamic>? metadata,
  }) async {
    await trackEvent(
      eventName: 'conversion',
      eventType: 'conversion',
      metadata: {
        'conversion_type': conversionType,
        'conversion_id': conversionId,
        if (value != null) 'value': value,
        ...?metadata,
      },
    );
  }
}

/// Riverpod provider for analytics service
final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AnalyticsService(apiClient);
});

/// Provider for user analytics dashboard
final userAnalyticsDashboardProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final analyticsService = ref.watch(analyticsServiceProvider);
  return await analyticsService.getUserAnalytics();
});

/// Provider for user activity summary
final userActivitySummaryProvider = FutureProvider.family<Map<String, dynamic>, String>(
  (ref, period) async {
    final analyticsService = ref.watch(analyticsServiceProvider);
    return await analyticsService.getUserActivitySummary(period: period);
  },
);

/// Provider for bidding statistics
final biddingStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final analyticsService = ref.watch(analyticsServiceProvider);
  return await analyticsService.getBiddingStats();
});

/// Provider for trending auctions
final trendingAuctionsProvider = FutureProvider.family<List<Map<String, dynamic>>, TrendingParams>(
  (ref, params) async {
    final analyticsService = ref.watch(analyticsServiceProvider);
    return await analyticsService.getTrendingAuctions(
      timeWindow: params.timeWindow,
      limit: params.limit,
    );
  },
);

/// Provider for popular searches
final popularSearchesProvider = FutureProvider<List<String>>((ref) async {
  final analyticsService = ref.watch(analyticsServiceProvider);
  return await analyticsService.getPopularSearches();
});

/// Parameters for trending auctions
class TrendingParams {
  final String timeWindow;
  final int limit;

  TrendingParams({
    this.timeWindow = '24h',
    this.limit = 10,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendingParams &&
          runtimeType == other.runtimeType &&
          timeWindow == other.timeWindow &&
          limit == other.limit;

  @override
  int get hashCode => timeWindow.hashCode ^ limit.hashCode;
}
