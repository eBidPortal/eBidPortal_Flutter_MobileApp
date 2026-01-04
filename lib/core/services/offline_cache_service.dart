import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Offline caching service for better performance and offline support
/// Uses Hive for structured data and SharedPreferences for simple key-value pairs
class OfflineCacheService {
  static const String _auctionsCacheBox = 'auctions_cache';
  static const String _productsCacheBox = 'products_cache';
  static const String _categoriesCacheBox = 'categories_cache';
  static const String _userDataCacheBox = 'user_data_cache';
  static const String _searchHistoryBox = 'search_history';
  static const String _watchlistCacheBox = 'watchlist_cache';
  
  late Box<dynamic> _auctionsBox;
  late Box<dynamic> _productsBox;
  late Box<dynamic> _categoriesBox;
  late Box<dynamic> _userDataBox;
  late Box<dynamic> _searchHistoryBox;
  late Box<dynamic> _watchlistBox;
  late SharedPreferences _prefs;

  /// Initialize Hive and open all boxes
  Future<void> initialize() async {
    try {
      print('💾 CACHE: Initializing offline cache service...');
      
      // Initialize Hive
      await Hive.initFlutter();
      
      // Open all boxes
      _auctionsBox = await Hive.openBox(_auctionsCacheBox);
      _productsBox = await Hive.openBox(_productsCacheBox);
      _categoriesBox = await Hive.openBox(_categoriesCacheBox);
      _userDataBox = await Hive.openBox(_userDataCacheBox);
      _searchHistoryBox = await Hive.openBox(_searchHistoryBox);
      _watchlistBox = await Hive.openBox(_watchlistCacheBox);
      
      // Initialize SharedPreferences
      _prefs = await SharedPreferences.getInstance();
      
      print('💾 CACHE: Initialization complete');
      print('💾 CACHE: Auctions cached: ${_auctionsBox.length}');
      print('💾 CACHE: Products cached: ${_productsBox.length}');
      print('💾 CACHE: Categories cached: ${_categoriesBox.length}');
    } catch (e) {
      print('💾 CACHE: Initialization error: $e');
      rethrow;
    }
  }

  // ==================== AUCTIONS CACHE ====================

  /// Cache auction data
  Future<void> cacheAuction(String auctionId, Map<String, dynamic> auctionData) async {
    try {
      final cacheData = {
        'data': auctionData,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      await _auctionsBox.put(auctionId, cacheData);
      print('💾 CACHE: Cached auction: $auctionId');
    } catch (e) {
      print('💾 CACHE: Error caching auction: $e');
    }
  }

  /// Get cached auction
  Map<String, dynamic>? getCachedAuction(String auctionId, {Duration maxAge = const Duration(hours: 1)}) {
    try {
      final cached = _auctionsBox.get(auctionId);
      if (cached == null) return null;

      final timestamp = cached['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;

      if (age > maxAge.inMilliseconds) {
        print('💾 CACHE: Auction cache expired: $auctionId');
        _auctionsBox.delete(auctionId);
        return null;
      }

      print('💾 CACHE: Retrieved cached auction: $auctionId');
      return Map<String, dynamic>.from(cached['data']);
    } catch (e) {
      print('💾 CACHE: Error getting cached auction: $e');
      return null;
    }
  }

  /// Cache auction list
  Future<void> cacheAuctionList(String key, List<Map<String, dynamic>> auctions) async {
    try {
      final cacheData = {
        'data': auctions,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      await _auctionsBox.put('list_$key', cacheData);
      print('💾 CACHE: Cached auction list: $key (${auctions.length} items)');
    } catch (e) {
      print('💾 CACHE: Error caching auction list: $e');
    }
  }

  /// Get cached auction list
  List<Map<String, dynamic>>? getCachedAuctionList(String key, {Duration maxAge = const Duration(minutes: 30)}) {
    try {
      final cached = _auctionsBox.get('list_$key');
      if (cached == null) return null;

      final timestamp = cached['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;

      if (age > maxAge.inMilliseconds) {
        print('💾 CACHE: Auction list cache expired: $key');
        _auctionsBox.delete('list_$key');
        return null;
      }

      print('💾 CACHE: Retrieved cached auction list: $key');
      final data = cached['data'] as List;
      return data.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      print('💾 CACHE: Error getting cached auction list: $e');
      return null;
    }
  }

  // ==================== PRODUCTS CACHE ====================

  /// Cache product data
  Future<void> cacheProduct(String productId, Map<String, dynamic> productData) async {
    try {
      final cacheData = {
        'data': productData,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      await _productsBox.put(productId, cacheData);
      print('💾 CACHE: Cached product: $productId');
    } catch (e) {
      print('💾 CACHE: Error caching product: $e');
    }
  }

  /// Get cached product
  Map<String, dynamic>? getCachedProduct(String productId, {Duration maxAge = const Duration(hours: 2)}) {
    try {
      final cached = _productsBox.get(productId);
      if (cached == null) return null;

      final timestamp = cached['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;

      if (age > maxAge.inMilliseconds) {
        _productsBox.delete(productId);
        return null;
      }

      return Map<String, dynamic>.from(cached['data']);
    } catch (e) {
      print('💾 CACHE: Error getting cached product: $e');
      return null;
    }
  }

  /// Cache nearby products
  Future<void> cacheNearbyProducts(double lat, double lon, List<Map<String, dynamic>> products) async {
    try {
      final key = 'nearby_${lat.toStringAsFixed(2)}_${lon.toStringAsFixed(2)}';
      final cacheData = {
        'data': products,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      await _productsBox.put(key, cacheData);
      print('💾 CACHE: Cached nearby products: $key (${products.length} items)');
    } catch (e) {
      print('💾 CACHE: Error caching nearby products: $e');
    }
  }

  /// Get cached nearby products
  List<Map<String, dynamic>>? getCachedNearbyProducts(double lat, double lon, {Duration maxAge = const Duration(minutes: 15)}) {
    try {
      final key = 'nearby_${lat.toStringAsFixed(2)}_${lon.toStringAsFixed(2)}';
      final cached = _productsBox.get(key);
      if (cached == null) return null;

      final timestamp = cached['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;

      if (age > maxAge.inMilliseconds) {
        _productsBox.delete(key);
        return null;
      }

      final data = cached['data'] as List;
      return data.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      print('💾 CACHE: Error getting cached nearby products: $e');
      return null;
    }
  }

  // ==================== CATEGORIES CACHE ====================

  /// Cache categories
  Future<void> cacheCategories(List<Map<String, dynamic>> categories) async {
    try {
      final cacheData = {
        'data': categories,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      await _categoriesBox.put('all_categories', cacheData);
      print('💾 CACHE: Cached categories (${categories.length} items)');
    } catch (e) {
      print('💾 CACHE: Error caching categories: $e');
    }
  }

  /// Get cached categories
  List<Map<String, dynamic>>? getCachedCategories({Duration maxAge = const Duration(days: 1)}) {
    try {
      final cached = _categoriesBox.get('all_categories');
      if (cached == null) return null;

      final timestamp = cached['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;

      if (age > maxAge.inMilliseconds) {
        _categoriesBox.delete('all_categories');
        return null;
      }

      final data = cached['data'] as List;
      return data.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      print('💾 CACHE: Error getting cached categories: $e');
      return null;
    }
  }

  // ==================== USER DATA CACHE ====================

  /// Cache user profile
  Future<void> cacheUserProfile(Map<String, dynamic> userData) async {
    try {
      final cacheData = {
        'data': userData,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      await _userDataBox.put('user_profile', cacheData);
      print('💾 CACHE: Cached user profile');
    } catch (e) {
      print('💾 CACHE: Error caching user profile: $e');
    }
  }

  /// Get cached user profile
  Map<String, dynamic>? getCachedUserProfile({Duration maxAge = const Duration(hours: 6)}) {
    try {
      final cached = _userDataBox.get('user_profile');
      if (cached == null) return null;

      final timestamp = cached['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;

      if (age > maxAge.inMilliseconds) {
        _userDataBox.delete('user_profile');
        return null;
      }

      return Map<String, dynamic>.from(cached['data']);
    } catch (e) {
      print('💾 CACHE: Error getting cached user profile: $e');
      return null;
    }
  }

  // ==================== WATCHLIST CACHE ====================

  /// Cache watchlist
  Future<void> cacheWatchlist(List<Map<String, dynamic>> watchlistItems) async {
    try {
      final cacheData = {
        'data': watchlistItems,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      await _watchlistBox.put('user_watchlist', cacheData);
      print('💾 CACHE: Cached watchlist (${watchlistItems.length} items)');
    } catch (e) {
      print('💾 CACHE: Error caching watchlist: $e');
    }
  }

  /// Get cached watchlist
  List<Map<String, dynamic>>? getCachedWatchlist({Duration maxAge = const Duration(minutes: 30)}) {
    try {
      final cached = _watchlistBox.get('user_watchlist');
      if (cached == null) return null;

      final timestamp = cached['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;

      if (age > maxAge.inMilliseconds) {
        _watchlistBox.delete('user_watchlist');
        return null;
      }

      final data = cached['data'] as List;
      return data.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      print('💾 CACHE: Error getting cached watchlist: $e');
      return null;
    }
  }

  // ==================== SEARCH HISTORY ====================

  /// Add search query to history
  Future<void> addSearchHistory(String query) async {
    try {
      final history = getSearchHistory();
      
      // Remove if already exists
      history.remove(query);
      
      // Add to beginning
      history.insert(0, query);
      
      // Keep only last 20 searches
      if (history.length > 20) {
        history.removeRange(20, history.length);
      }
      
      await _searchHistoryBox.put('queries', history);
      print('💾 CACHE: Added search history: $query');
    } catch (e) {
      print('💾 CACHE: Error adding search history: $e');
    }
  }

  /// Get search history
  List<String> getSearchHistory() {
    try {
      final history = _searchHistoryBox.get('queries');
      if (history == null) return [];
      return List<String>.from(history);
    } catch (e) {
      print('💾 CACHE: Error getting search history: $e');
      return [];
    }
  }

  /// Clear search history
  Future<void> clearSearchHistory() async {
    try {
      await _searchHistoryBox.delete('queries');
      print('💾 CACHE: Cleared search history');
    } catch (e) {
      print('💾 CACHE: Error clearing search history: $e');
    }
  }

  // ==================== CACHE MANAGEMENT ====================

  /// Get cache statistics
  Map<String, dynamic> getCacheStats() {
    return {
      'auctions': _auctionsBox.length,
      'products': _productsBox.length,
      'categories': _categoriesBox.length,
      'userData': _userDataBox.length,
      'searchHistory': _searchHistoryBox.length,
      'watchlist': _watchlistBox.length,
      'totalSize': _auctionsBox.length + 
                   _productsBox.length + 
                   _categoriesBox.length + 
                   _userDataBox.length + 
                   _searchHistoryBox.length + 
                   _watchlistBox.length,
    };
  }

  /// Clear all caches
  Future<void> clearAllCaches() async {
    try {
      await _auctionsBox.clear();
      await _productsBox.clear();
      await _categoriesBox.clear();
      await _userDataBox.clear();
      await _searchHistoryBox.clear();
      await _watchlistBox.clear();
      print('💾 CACHE: All caches cleared');
    } catch (e) {
      print('💾 CACHE: Error clearing caches: $e');
    }
  }

  /// Clear expired caches
  Future<void> clearExpiredCaches() async {
    try {
      int cleared = 0;
      
      // Clear expired auctions
      for (var key in _auctionsBox.keys) {
        final cached = _auctionsBox.get(key);
        if (cached != null) {
          final timestamp = cached['timestamp'] as int;
          final age = DateTime.now().millisecondsSinceEpoch - timestamp;
          if (age > Duration(hours: 2).inMilliseconds) {
            await _auctionsBox.delete(key);
            cleared++;
          }
        }
      }
      
      // Clear expired products
      for (var key in _productsBox.keys) {
        final cached = _productsBox.get(key);
        if (cached != null) {
          final timestamp = cached['timestamp'] as int;
          final age = DateTime.now().millisecondsSinceEpoch - timestamp;
          if (age > Duration(hours: 3).inMilliseconds) {
            await _productsBox.delete(key);
            cleared++;
          }
        }
      }
      
      print('💾 CACHE: Cleared $cleared expired cache entries');
    } catch (e) {
      print('💾 CACHE: Error clearing expired caches: $e');
    }
  }

  /// Check if device is online
  Future<bool> isOnline() async {
    // This is a simple check - in production, use connectivity_plus package
    return _prefs.getBool('is_online') ?? true;
  }

  /// Set online status
  Future<void> setOnlineStatus(bool isOnline) async {
    await _prefs.setBool('is_online', isOnline);
  }
}

/// Riverpod provider for offline cache service
final offlineCacheServiceProvider = Provider<OfflineCacheService>((ref) {
  return OfflineCacheService();
});

/// Provider for cache statistics
final cacheStatsProvider = Provider<Map<String, dynamic>>((ref) {
  final cacheService = ref.watch(offlineCacheServiceProvider);
  return cacheService.getCacheStats();
});

/// Provider for search history
final searchHistoryProvider = Provider<List<String>>((ref) {
  final cacheService = ref.watch(offlineCacheServiceProvider);
  return cacheService.getSearchHistory();
});
