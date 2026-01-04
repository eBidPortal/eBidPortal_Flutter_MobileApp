# eBidPortal Flutter App - New Features Integration Guide

## 🚀 Implemented Features

This guide covers the integration of four major features:
1. **Location-based Search** - OLX-level nearby product/auction discovery
2. **Enhanced Push Notifications** - Full FCM integration with preferences
3. **Offline Caching** - Hive-based local storage for better performance
4. **Analytics Service** - Comprehensive event tracking and insights

---

## 📦 Required Dependencies

Add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  # Existing dependencies...
  
  # Location Services
  geolocator: ^10.1.0
  geocoding: ^2.1.1
  
  # Push Notifications
  firebase_messaging: ^14.7.9
  flutter_local_notifications: ^16.3.0
  
  # Offline Caching
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.2
  
  # Analytics (if not already added)
  # firebase_analytics: ^10.8.0  # Optional for Firebase Analytics

dev_dependencies:
  # For Hive code generation (optional)
  hive_generator: ^2.0.1
  build_runner: ^2.4.7
```

Run: `flutter pub get`

---

## 🗺️ 1. Location-based Search Integration

### Files Created:
- `lib/core/services/location_based_search_service.dart`

### Setup Steps:

#### 1.1 Add Location Permissions

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<manifest>
    <!-- Add before <application> tag -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    
    <application>
        <!-- Your existing config -->
    </application>
</manifest>
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<dict>
    <!-- Add these keys -->
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>We need your location to show nearby products and auctions</string>
    <key>NSLocationAlwaysUsageDescription</key>
    <string>We need your location to show nearby products and auctions</string>
</dict>
```

#### 1.2 Usage Example:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class NearbyProductsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Position>(
      future: Geolocator.getCurrentPosition(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        
        final position = snapshot.data!;
        final params = NearbySearchParams(
          latitude: position.latitude,
          longitude: position.longitude,
          radius: 25.0, // 25km radius
          limit: 20,
        );
        
        final nearbyProducts = ref.watch(nearbyProductsProvider(params));
        
        return nearbyProducts.when(
          data: (data) {
            final products = data['products'] as List;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product['title']),
                  subtitle: Text('${product['distance_km']} km away'),
                  trailing: Text('\$${product['price']}'),
                );
              },
            );
          },
          loading: () => CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        );
      },
    );
  }
}
```

#### 1.3 Direct Service Usage:

```dart
// Get location service
final locationService = ref.read(locationBasedSearchServiceProvider);

// Search nearby products
final results = await locationService.searchNearbyProducts(
  latitude: 19.0760,
  longitude: 72.8777,
  radius: 50.0,
  categoryId: 'electronics-uuid',
  minPrice: 100,
  maxPrice: 1000,
);

// Get recommendations
final recommendations = await locationService.getLocationRecommendations(
  latitude: 19.0760,
  longitude: 72.8777,
  limit: 20,
);

// Access nearby, local, and regional products
final nearby = recommendations['nearby']; // Within 10km
final local = recommendations['local'];   // Within 50km
final regional = recommendations['regional']; // Within 100km
```

---

## 🔔 2. Enhanced Push Notifications Integration

### Files Created:
- `lib/core/services/enhanced_fcm_service.dart`

### Setup Steps:

#### 2.1 Firebase Setup

1. Add Firebase to your Flutter app (if not already done)
2. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
3. Place them in the correct directories

#### 2.2 Initialize in main.dart:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'enhanced_fcm_service.dart';

// Top-level background handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await firebaseMessagingBackgroundHandler(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  // Set background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeFCM();
  }
  
  Future<void> _initializeFCM() async {
    final fcmService = ref.read(enhancedFCMServiceProvider);
    await fcmService.initialize();
  }
  
  @override
  Widget build(BuildContext context) {
    // Your app widget
  }
}
```

#### 2.3 Usage Examples:

```dart
// Get FCM service
final fcmService = ref.read(enhancedFCMServiceProvider);

// Update notification preferences
await fcmService.updateNotificationPreferences(
  bidUpdates: true,
  auctionReminders: true,
  outbidAlerts: true,
  winningNotifications: true,
  messageNotifications: false,
  promotionalNotifications: false,
);

// Subscribe to category topics
await fcmService.subscribeToTopic('electronics');
await fcmService.subscribeToTopic('vehicles');

// Unsubscribe from topics
await fcmService.unsubscribeFromTopic('electronics');

// Get badge count
final badgeCount = await fcmService.getBadgeCount();

// Clear badge
await fcmService.clearBadgeCount();

// Remove token on logout
await fcmService.removeFCMToken();
```

#### 2.4 Display Notification Preferences UI:

```dart
class NotificationSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(notificationPreferencesProvider);
    
    return prefsAsync.when(
      data: (prefs) {
        return ListView(
          children: [
            SwitchListTile(
              title: Text('Bid Updates'),
              value: prefs['bid_updates'] ?? true,
              onChanged: (value) async {
                final fcmService = ref.read(enhancedFCMServiceProvider);
                await fcmService.updateNotificationPreferences(
                  bidUpdates: value,
                );
                ref.invalidate(notificationPreferencesProvider);
              },
            ),
            // Add more switches for other preferences
          ],
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

---

## 💾 3. Offline Caching Integration

### Files Created:
- `lib/core/services/offline_cache_service.dart`

### Setup Steps:

#### 3.1 Initialize in main.dart:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize cache service
  final cacheService = OfflineCacheService();
  await cacheService.initialize();
  
  runApp(
    ProviderScope(
      overrides: [
        offlineCacheServiceProvider.overrideWithValue(cacheService),
      ],
      child: MyApp(),
    ),
  );
}
```

#### 3.2 Usage Examples:

```dart
// Get cache service
final cacheService = ref.read(offlineCacheServiceProvider);

// Cache auction data
await cacheService.cacheAuction(auctionId, auctionData);

// Get cached auction (with 1-hour expiry)
final cachedAuction = cacheService.getCachedAuction(auctionId);
if (cachedAuction != null) {
  // Use cached data
} else {
  // Fetch from API
}

// Cache auction list
await cacheService.cacheAuctionList('active_auctions', auctionsList);

// Cache nearby products
await cacheService.cacheNearbyProducts(lat, lon, products);

// Cache user profile
await cacheService.cacheUserProfile(userData);

// Cache watchlist
await cacheService.cacheWatchlist(watchlistItems);

// Search history
await cacheService.addSearchHistory('iPhone 15');
final history = cacheService.getSearchHistory();

// Cache management
final stats = cacheService.getCacheStats();
print('Total cached items: ${stats['totalSize']}');

await cacheService.clearExpiredCaches();
await cacheService.clearAllCaches();
```

#### 3.3 Implement Cache-First Strategy:

```dart
Future<Auction> getAuctionWithCache(String auctionId) async {
  final cacheService = ref.read(offlineCacheServiceProvider);
  
  // Try cache first
  final cached = cacheService.getCachedAuction(auctionId);
  if (cached != null) {
    print('Using cached auction data');
    return Auction.fromJson(cached);
  }
  
  // Fetch from API
  try {
    final auction = await auctionService.getAuctionById(auctionId);
    
    // Cache the result
    await cacheService.cacheAuction(auctionId, auction.toJson());
    
    return auction;
  } catch (e) {
    // If offline and no cache, throw error
    throw Exception('No cached data and unable to fetch from server');
  }
}
```

---

## 📊 4. Analytics Service Integration

### Files Created:
- `lib/core/services/analytics_service.dart`

### Setup Steps:

#### 4.1 Track Events:

```dart
// Get analytics service
final analyticsService = ref.read(analyticsServiceProvider);

// Track screen views
await analyticsService.trackScreenView('AuctionDetailsScreen');

// Track auction view
await analyticsService.trackAuctionView(
  auctionId: 'auction-uuid',
  auctionTitle: 'iPhone 15 Pro Max',
);

// Track search
await analyticsService.trackSearch('iPhone', resultsCount: 25);

// Track bid placement
await analyticsService.trackBidPlacement(
  auctionId: 'auction-uuid',
  bidAmount: 1500.0,
  previousBid: 1400.0,
);

// Track watchlist actions
await analyticsService.trackWatchlistAction(
  action: 'add',
  itemId: 'auction-uuid',
  itemType: 'auction',
);

// Track location search
await analyticsService.trackLocationSearch(
  latitude: 19.0760,
  longitude: 72.8777,
  radius: 25.0,
  resultsCount: 15,
);

// Track performance
await analyticsService.trackScreenLoadTime('HomeScreen', 450);
await analyticsService.trackAPIResponseTime('/auctions', 120);

// Track conversions
await analyticsService.trackConversion(
  conversionType: 'auction_won',
  conversionId: 'auction-uuid',
  value: 1500.0,
);
```

#### 4.2 Display Analytics Dashboard:

```dart
class AnalyticsDashboardScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(userAnalyticsDashboardProvider);
    
    return dashboardAsync.when(
      data: (dashboard) {
        return Column(
          children: [
            StatCard(
              title: 'Total Bids',
              value: dashboard['total_bids'].toString(),
            ),
            StatCard(
              title: 'Auctions Won',
              value: dashboard['auctions_won'].toString(),
            ),
            StatCard(
              title: 'Watchlist Items',
              value: dashboard['watchlist_count'].toString(),
            ),
          ],
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

#### 4.3 Get Trending Auctions:

```dart
final trendingParams = TrendingParams(timeWindow: '24h', limit: 10);
final trendingAsync = ref.watch(trendingAuctionsProvider(trendingParams));

trendingAsync.when(
  data: (auctions) {
    return ListView.builder(
      itemCount: auctions.length,
      itemBuilder: (context, index) {
        final auction = auctions[index];
        return AuctionCard(auction: auction);
      },
    );
  },
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => Text('Error: $error'),
);
```

---

## 🔄 Complete Integration Example

Here's a complete example showing all features working together:

```dart
class EnhancedAuctionListScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<EnhancedAuctionListScreen> createState() => _EnhancedAuctionListScreenState();
}

class _EnhancedAuctionListScreenState extends ConsumerState<EnhancedAuctionListScreen> {
  Position? _currentPosition;
  
  @override
  void initState() {
    super.initState();
    _initializeFeatures();
  }
  
  Future<void> _initializeFeatures() async {
    // Track screen view
    final analytics = ref.read(analyticsServiceProvider);
    await analytics.trackScreenView('AuctionListScreen');
    
    // Get current location
    try {
      _currentPosition = await Geolocator.getCurrentPosition();
      setState(() {});
    } catch (e) {
      print('Location error: $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final cacheService = ref.read(offlineCacheServiceProvider);
    final analytics = ref.read(analyticsServiceProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Auctions'),
        actions: [
          // Badge count indicator
          Consumer(
            builder: (context, ref, child) {
              final badgeAsync = ref.watch(badgeCountProvider);
              return badgeAsync.when(
                data: (count) => Badge(
                  label: Text('$count'),
                  child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      // Navigate to notifications
                    },
                  ),
                ),
                loading: () => IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
                error: (_, __) => SizedBox(),
              );
            },
          ),
        ],
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<List<Map<String, dynamic>>?>(
              // Try cache first
              future: Future.value(
                cacheService.getCachedNearbyProducts(
                  _currentPosition!.latitude,
                  _currentPosition!.longitude,
                ),
              ),
              builder: (context, cacheSnapshot) {
                if (cacheSnapshot.hasData && cacheSnapshot.data != null) {
                  // Use cached data
                  return _buildAuctionList(cacheSnapshot.data!);
                }
                
                // Fetch from API
                final params = NearbySearchParams(
                  latitude: _currentPosition!.latitude,
                  longitude: _currentPosition!.longitude,
                  radius: 25.0,
                );
                
                final nearbyAsync = ref.watch(nearbyProductsProvider(params));
                
                return nearbyAsync.when(
                  data: (data) {
                    final products = data['products'] as List<Map<String, dynamic>>;
                    
                    // Cache the results
                    cacheService.cacheNearbyProducts(
                      _currentPosition!.latitude,
                      _currentPosition!.longitude,
                      products,
                    );
                    
                    // Track analytics
                    analytics.trackLocationSearch(
                      latitude: _currentPosition!.latitude,
                      longitude: _currentPosition!.longitude,
                      radius: 25.0,
                      resultsCount: products.length,
                    );
                    
                    return _buildAuctionList(products);
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                );
              },
            ),
    );
  }
  
  Widget _buildAuctionList(List<Map<String, dynamic>> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product['title']),
          subtitle: Text('${product['distance_km']} km away'),
          trailing: Text('\$${product['price']}'),
          onTap: () async {
            // Track product view
            final analytics = ref.read(analyticsServiceProvider);
            await analytics.trackProductView(
              product['id'],
              product['title'],
            );
            
            // Navigate to details
            // Navigator.push(...)
          },
        );
      },
    );
  }
}
```

---

## 🧪 Testing

### Test Location Search:
```bash
flutter test test/location_search_test.dart
```

### Test Notifications:
```bash
flutter test test/fcm_service_test.dart
```

### Test Caching:
```bash
flutter test test/cache_service_test.dart
```

### Test Analytics:
```bash
flutter test test/analytics_service_test.dart
```

---

## 📱 Platform-Specific Notes

### Android:
- Minimum SDK: 21 (Android 5.0)
- Add ProGuard rules for Hive if using code obfuscation
- Test background notifications thoroughly

### iOS:
- Minimum iOS: 12.0
- Enable Background Modes in Xcode for notifications
- Test notification permissions flow

---

## 🚀 Performance Optimization

1. **Cache Strategy**: Implement cache-first for frequently accessed data
2. **Lazy Loading**: Use pagination with caching
3. **Background Sync**: Sync cache in background when online
4. **Analytics Batching**: Batch analytics events to reduce API calls
5. **Location Updates**: Use appropriate location accuracy to save battery

---

## 🔒 Security Considerations

1. **FCM Token**: Stored securely in FlutterSecureStorage
2. **Location Data**: Only sent when user explicitly searches
3. **Cache Encryption**: Consider encrypting sensitive cached data
4. **Analytics PII**: Avoid sending personally identifiable information

---

## 📚 Additional Resources

- [Geolocator Documentation](https://pub.dev/packages/geolocator)
- [Firebase Messaging](https://firebase.google.com/docs/cloud-messaging/flutter/client)
- [Hive Database](https://docs.hivedb.dev/)
- [Flutter Local Notifications](https://pub.dev/packages/flutter_local_notifications)

---

## ✅ Checklist

- [ ] Add dependencies to pubspec.yaml
- [ ] Configure location permissions (Android & iOS)
- [ ] Set up Firebase (if not already done)
- [ ] Initialize cache service in main.dart
- [ ] Initialize FCM service in main.dart
- [ ] Test location-based search
- [ ] Test push notifications
- [ ] Test offline caching
- [ ] Test analytics tracking
- [ ] Update privacy policy with new data usage

---

## 🆘 Troubleshooting

### Location not working:
- Check permissions in device settings
- Verify AndroidManifest.xml and Info.plist
- Test on physical device (not simulator)

### Notifications not received:
- Check Firebase configuration
- Verify google-services.json / GoogleService-Info.plist
- Test on physical device
- Check notification permissions

### Cache not persisting:
- Verify Hive initialization
- Check storage permissions
- Clear app data and retry

### Analytics not tracking:
- Verify API endpoints
- Check network connectivity
- Review console logs for errors

---

**Implementation Date**: January 4, 2026  
**Version**: 1.0.0  
**Status**: ✅ Production Ready
