# eBidPortal Flutter - Quick Reference Card

## 🚀 Quick Start Commands

```bash
# Add all dependencies
flutter pub add geolocator geocoding firebase_messaging flutter_local_notifications hive hive_flutter shared_preferences

# Add dev dependencies
flutter pub add --dev hive_generator build_runner

# Get dependencies
flutter pub get

# Run the app
flutter run
```

---

## 📍 Location-Based Search

### Get Nearby Products
```dart
import 'package:geolocator/geolocator.dart';

// Get current location
final position = await Geolocator.getCurrentPosition();

// Create search params
final params = NearbySearchParams(
  latitude: position.latitude,
  longitude: position.longitude,
  radius: 25.0,  // 25km
  limit: 20,
  categoryId: 'category-uuid',  // optional
);

// Use provider
final results = ref.watch(nearbyProductsProvider(params));

// Or use service directly
final service = ref.read(locationBasedSearchServiceProvider);
final data = await service.searchNearbyProducts(
  latitude: position.latitude,
  longitude: position.longitude,
  radius: 25.0,
);
```

### Get Location Recommendations
```dart
final params = LocationParams(
  latitude: 19.0760,
  longitude: 72.8777,
  limit: 20,
);

final recommendations = ref.watch(locationRecommendationsProvider(params));

// Access zones
final nearby = recommendations['nearby'];    // Within 10km
final local = recommendations['local'];      // Within 50km
final regional = recommendations['regional']; // Within 100km
```

---

## 🔔 Push Notifications

### Initialize FCM
```dart
// In main.dart
final fcmService = ref.read(enhancedFCMServiceProvider);
await fcmService.initialize();
```

### Update Preferences
```dart
await fcmService.updateNotificationPreferences(
  bidUpdates: true,
  auctionReminders: true,
  outbidAlerts: true,
  winningNotifications: true,
);
```

### Subscribe to Topics
```dart
await fcmService.subscribeToTopic('electronics');
await fcmService.unsubscribeFromTopic('vehicles');
```

### Get Badge Count
```dart
final badgeCount = ref.watch(badgeCountProvider);
// Or
final count = await fcmService.getBadgeCount();
```

### Remove Token (Logout)
```dart
await fcmService.removeFCMToken();
```

---

## 💾 Offline Caching

### Initialize Cache
```dart
// In main.dart
final cacheService = OfflineCacheService();
await cacheService.initialize();
```

### Cache Auction
```dart
final cache = ref.read(offlineCacheServiceProvider);

// Cache single auction
await cache.cacheAuction(auctionId, auctionData);

// Get cached auction
final cached = cache.getCachedAuction(auctionId);
if (cached != null) {
  // Use cached data
}
```

### Cache List
```dart
// Cache auction list
await cache.cacheAuctionList('active_auctions', auctionsList);

// Get cached list
final list = cache.getCachedAuctionList('active_auctions');
```

### Cache Nearby Products
```dart
await cache.cacheNearbyProducts(lat, lon, products);
final cached = cache.getCachedNearbyProducts(lat, lon);
```

### Search History
```dart
// Add to history
await cache.addSearchHistory('iPhone 15');

// Get history
final history = cache.getSearchHistory();

// Clear history
await cache.clearSearchHistory();
```

### Cache Management
```dart
// Get stats
final stats = cache.getCacheStats();
print('Total items: ${stats['totalSize']}');

// Clear expired
await cache.clearExpiredCaches();

// Clear all
await cache.clearAllCaches();
```

---

## 📊 Analytics

### Track Events
```dart
final analytics = ref.read(analyticsServiceProvider);

// Screen view
await analytics.trackScreenView('HomeScreen');

// Auction view
await analytics.trackAuctionView(auctionId, title);

// Search
await analytics.trackSearch(query, resultsCount);

// Bid placement
await analytics.trackBidPlacement(
  auctionId: id,
  bidAmount: 1500.0,
  previousBid: 1400.0,
);

// Watchlist action
await analytics.trackWatchlistAction(
  action: 'add',
  itemId: id,
  itemType: 'auction',
);

// Location search
await analytics.trackLocationSearch(
  latitude: lat,
  longitude: lon,
  radius: 25.0,
  resultsCount: 15,
);
```

### Get Analytics
```dart
// User dashboard
final dashboard = ref.watch(userAnalyticsDashboardProvider);

// Activity summary
final activity = ref.watch(userActivitySummaryProvider('30d'));

// Bidding stats
final biddingStats = ref.watch(biddingStatsProvider);

// Trending auctions
final trending = ref.watch(trendingAuctionsProvider(
  TrendingParams(timeWindow: '24h', limit: 10),
));

// Popular searches
final searches = ref.watch(popularSearchesProvider);
```

### Track Performance
```dart
// Screen load time
await analytics.trackScreenLoadTime('HomeScreen', 450);

// API response time
await analytics.trackAPIResponseTime('/auctions', 120);

// Custom metric
await analytics.trackPerformanceMetric(
  metricName: 'image_load_time',
  value: 250.0,
  unit: 'ms',
);
```

---

## 🔄 Complete Example: Cache-First Pattern

```dart
Future<Auction> getAuctionWithCache(String auctionId) async {
  final cache = ref.read(offlineCacheServiceProvider);
  final analytics = ref.read(analyticsServiceProvider);
  
  // 1. Try cache first
  final cached = cache.getCachedAuction(auctionId);
  if (cached != null) {
    print('Using cached data');
    return Auction.fromJson(cached);
  }
  
  // 2. Fetch from API
  try {
    final startTime = DateTime.now();
    final auction = await auctionService.getAuctionById(auctionId);
    final duration = DateTime.now().difference(startTime).inMilliseconds;
    
    // 3. Cache the result
    await cache.cacheAuction(auctionId, auction.toJson());
    
    // 4. Track analytics
    await analytics.trackAuctionView(auctionId, auction.title);
    await analytics.trackAPIResponseTime('/auctions/$auctionId', duration);
    
    return auction;
  } catch (e) {
    print('Error fetching auction: $e');
    rethrow;
  }
}
```

---

## 🎯 Complete Example: Location Search with Cache & Analytics

```dart
Future<List<Product>> getNearbyProductsComplete() async {
  final cache = ref.read(offlineCacheServiceProvider);
  final analytics = ref.read(analyticsServiceProvider);
  final locationService = ref.read(locationBasedSearchServiceProvider);
  
  // 1. Get current location
  final position = await Geolocator.getCurrentPosition();
  
  // 2. Check cache first
  final cached = cache.getCachedNearbyProducts(
    position.latitude,
    position.longitude,
  );
  
  if (cached != null) {
    print('Using cached nearby products');
    return cached.map((e) => Product.fromJson(e)).toList();
  }
  
  // 3. Fetch from API
  final data = await locationService.searchNearbyProducts(
    latitude: position.latitude,
    longitude: position.longitude,
    radius: 25.0,
    limit: 20,
  );
  
  final products = data['products'] as List;
  
  // 4. Cache results
  await cache.cacheNearbyProducts(
    position.latitude,
    position.longitude,
    products.cast<Map<String, dynamic>>(),
  );
  
  // 5. Track analytics
  await analytics.trackLocationSearch(
    latitude: position.latitude,
    longitude: position.longitude,
    radius: 25.0,
    resultsCount: products.length,
  );
  
  return products.map((e) => Product.fromJson(e)).toList();
}
```

---

## 🔧 Providers Reference

```dart
// Location
locationBasedSearchServiceProvider
nearbyProductsProvider(NearbySearchParams)
locationRecommendationsProvider(LocationParams)

// Notifications
enhancedFCMServiceProvider
notificationPreferencesProvider
badgeCountProvider

// Cache
offlineCacheServiceProvider
cacheStatsProvider
searchHistoryProvider

// Analytics
analyticsServiceProvider
userAnalyticsDashboardProvider
userActivitySummaryProvider(period)
biddingStatsProvider
trendingAuctionsProvider(TrendingParams)
popularSearchesProvider
```

---

## ⚙️ Configuration Files

### Android Permissions
```xml
<!-- android/app/src/main/AndroidManifest.xml -->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
```

### iOS Permissions
```xml
<!-- ios/Runner/Info.plist -->
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show nearby products</string>
```

---

## 🐛 Common Issues

### Location not working
```dart
// Check permissions
final permission = await Geolocator.checkPermission();
if (permission == LocationPermission.denied) {
  await Geolocator.requestPermission();
}
```

### Notifications not received
```dart
// Check FCM token
final token = await FirebaseMessaging.instance.getToken();
print('FCM Token: $token');

// Check permissions
final settings = await FirebaseMessaging.instance.requestPermission();
print('Permission: ${settings.authorizationStatus}');
```

### Cache not working
```dart
// Verify initialization
final cache = ref.read(offlineCacheServiceProvider);
final stats = cache.getCacheStats();
print('Cache stats: $stats');
```

---

## 📱 Testing on Device

```bash
# Android
flutter run -d <device-id>

# iOS
flutter run -d <device-id>

# List devices
flutter devices

# Build APK
flutter build apk --release

# Build iOS
flutter build ios --release
```

---

## 📚 File Locations

```
lib/core/services/
├── location_based_search_service.dart  # Location search
├── enhanced_fcm_service.dart           # Push notifications
├── offline_cache_service.dart          # Caching
└── analytics_service.dart              # Analytics

lib/core/storage/
└── storage_service.dart                # Updated with FCM methods

Documentation/
├── INTEGRATION_GUIDE.md                # Full setup guide
├── IMPLEMENTATION_SUMMARY.md           # Feature summary
└── QUICK_REFERENCE.md                  # This file
```

---

## 🎓 Best Practices

1. **Always use cache-first pattern** for frequently accessed data
2. **Track analytics** for all user interactions
3. **Handle location permissions** gracefully
4. **Test notifications** on physical devices
5. **Clear expired caches** periodically
6. **Batch analytics events** to reduce API calls
7. **Use appropriate cache expiry** times
8. **Handle offline mode** gracefully

---

**Quick Reference Version**: 1.0.0  
**Last Updated**: January 4, 2026
