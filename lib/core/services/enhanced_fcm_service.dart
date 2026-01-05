import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'dart:io';
import '../network/api_client.dart';
import '../storage/storage_service.dart';

/// Enhanced FCM (Firebase Cloud Messaging) service with full integration
/// Handles push notifications, token management, and notification preferences
class EnhancedFCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();
  final ApiClient _apiClient;
  final StorageService _storageService;
  final _notificationStreamController = StreamController<Map<String, dynamic>>.broadcast();
  Map<String, dynamic>? _lastNotification;

  EnhancedFCMService(this._apiClient, this._storageService);

  Stream<Map<String, dynamic>> get notificationStream => _notificationStreamController.stream;

  Map<String, dynamic>? consumeLastNotification() {
    final data = _lastNotification;
    _lastNotification = null;
    return data;
  }

  /// Initialize FCM service with permissions and handlers
  Future<void> initialize() async {
    try {
      print('🔔 FCM: Initializing Firebase Cloud Messaging...');

      // Request notification permissions
      final settings = await _requestPermissions();
      
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('🔔 FCM: Notification permissions granted');
        
        // Initialize local notifications
        await _initializeLocalNotifications();
        
        // Get and register FCM token
        await _registerFCMToken();
        
        // Set up message handlers
        _setupMessageHandlers();
        
        // Listen for token refresh
        _firebaseMessaging.onTokenRefresh.listen(_onTokenRefresh);
        
        print('🔔 FCM: Initialization complete');
      } else {
        print('🔔 FCM: Notification permissions denied');
      }
      
      // Check for launch from local notification
      final launchDetails = await _localNotifications.getNotificationAppLaunchDetails();
      if (launchDetails != null && launchDetails.didNotificationLaunchApp) {
        print('🔔 FCM: App launched from local notification');
        final payload = launchDetails.notificationResponse?.payload;
        if (payload != null) {
           try {
             final data = jsonDecode(payload);
             if (data is Map<String, dynamic>) {
               // Small delay to ensure listeners are ready
               Future.delayed(const Duration(milliseconds: 500), () {
                 _handleNotificationNavigation(data);
               });
             }
           } catch (e) {
             print('🔔 FCM: Error decoding launch payload: $e');
           }
        }
      }
    } catch (e) {
      print('🔔 FCM: Initialization error: $e');
    }
  }

  /// Request notification permissions
  Future<NotificationSettings> _requestPermissions() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    
    print('🔔 FCM: Permission status: ${settings.authorizationStatus}');
    return settings;
  }

  /// Initialize local notifications for foreground messages
  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    print('🔔 FCM: Local notifications initialized');
  }

  /// Get FCM token and register with backend
  Future<void> _registerFCMToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      
      if (token != null) {
        print('🔔 FCM: Token obtained: ${token.substring(0, 20)}...');
        
        // Save token locally
        await _storageService.setFCMToken(token);
        
        // Register token with backend
        await _sendTokenToBackend(token);
      } else {
        print('🔔 FCM: Failed to get FCM token');
      }
    } catch (e) {
      print('🔔 FCM: Error registering token: $e');
    }
  }

  /// Send FCM token to backend API
  Future<void> _sendTokenToBackend(String token) async {
    try {
      final response = await _apiClient.post(
        '/notifications/fcm-token',
        data: {
          'token': token, // Some backends expect 'token'
          'fcm_token': token, // Some expect 'fcm_token'
          'device_id': token, // Fallback device id
          'device_type': Platform.isIOS ? 'ios' : 'android',
          'platform': Platform.isIOS ? 'ios' : 'android', // Some expect root level platform
          'device_info': {
            'platform': Platform.operatingSystem,
            'version': Platform.operatingSystemVersion,
            'device_name': Platform.localHostname,
          },
        },
      );

      if (response.data['success'] == true) {
        print('🔔 FCM: Token registered with backend successfully');
      } else {
        print('🔔 FCM: Failed to register token with backend: ${response.data['message']}');
      }
    } catch (e) {
      print('🔔 FCM: Error sending token to backend: $e');
    }
  }

  /// Handle token refresh
  Future<void> _onTokenRefresh(String token) async {
    print('🔔 FCM: Token refreshed: ${token.substring(0, 20)}...');
    await _storageService.setFCMToken(token);
    await _sendTokenToBackend(token);
  }

  /// Set up message handlers for different states
  void _setupMessageHandlers() {
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    
    // Handle background messages (when app is in background but not terminated)
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
    
    // Handle messages when app is opened from terminated state
    _firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        _handleTerminatedMessage(message);
      }
    });

    print('🔔 FCM: Message handlers configured');
  }

  /// Handle foreground messages (app is open)
  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    print('🔔 FCM: Foreground message received');
    print('🔔 FCM: Title: ${message.notification?.title}');
    print('🔔 FCM: Body: ${message.notification?.body}');
    print('🔔 FCM: Data: ${message.data}');

    // Show local notification
    await _showLocalNotification(message);
  }

  /// Handle background messages (app in background)
  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    print('🔔 FCM: Background message opened');
    print('🔔 FCM: Data: ${message.data}');
    
    // Enrich payload
    final payloadData = Map<String, dynamic>.from(message.data);
    if (message.notification != null) {
      payloadData['title'] ??= message.notification!.title;
      payloadData['message'] ??= message.notification!.body;
    }
    
    // Navigate to appropriate screen based on notification type
    await _handleNotificationNavigation(payloadData);
  }

  /// Handle messages when app opened from terminated state
  Future<void> _handleTerminatedMessage(RemoteMessage message) async {
    print('🔔 FCM: Terminated message opened');
    print('🔔 FCM: Data: ${message.data}');
    
    // Enrich payload
    final payloadData = Map<String, dynamic>.from(message.data);
    if (message.notification != null) {
      payloadData['title'] ??= message.notification!.title;
      payloadData['message'] ??= message.notification!.body;
    }
    
    // Navigate to appropriate screen
    await _handleNotificationNavigation(payloadData);
  }

  /// Show local notification for foreground messages
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'ebidportal_channel_high_importance', // Updated ID
      'eBidPortal Notifications',
      channelDescription: 'Notifications for auctions, bids, and updates',
      importance: Importance.max,
      priority: Priority.max,
      showWhen: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Prepare payload by merging data and notification content
    final payloadData = Map<String, dynamic>.from(message.data);
    if (message.notification != null) {
      payloadData['title'] ??= message.notification!.title;
      payloadData['message'] ??= message.notification!.body;
    }

    await _localNotifications.show(
      message.hashCode,
      message.notification?.title ?? 'eBidPortal',
      message.notification?.body ?? '',
      details,
      payload: jsonEncode(payloadData),
    );
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    print('🔔 FCM: Notification tapped: ${response.payload}');
    // Parse payload and navigate
    if (response.payload != null) {
      try {
        final data = jsonDecode(response.payload!);
        if (data is Map<String, dynamic>) {
          _handleNotificationNavigation(data);
        }
      } catch (e) {
        print('🔔 FCM: Error decoding notification payload: $e');
      }
    }
  }

  /// Handle navigation based on notification data
  Future<void> _handleNotificationNavigation(Map<String, dynamic> data) async {
    _lastNotification = data;
    _notificationStreamController.add(data);
  }

  /// Update notification preferences on backend
  Future<void> updateNotificationPreferences({
    bool? bidUpdates,
    bool? auctionReminders,
    bool? outbidAlerts,
    bool? winningNotifications,
    bool? messageNotifications,
    bool? promotionalNotifications,
  }) async {
    try {
      final response = await _apiClient.put(
        '/notifications/preferences',
        data: {
          if (bidUpdates != null) 'bid_updates': bidUpdates,
          if (auctionReminders != null) 'auction_reminders': auctionReminders,
          if (outbidAlerts != null) 'outbid_alerts': outbidAlerts,
          if (winningNotifications != null) 'winning_notifications': winningNotifications,
          if (messageNotifications != null) 'message_notifications': messageNotifications,
          if (promotionalNotifications != null) 'promotional_notifications': promotionalNotifications,
        },
      );

      if (response.data['success'] == true) {
        print('🔔 FCM: Notification preferences updated');
      } else {
        throw Exception('Failed to update preferences');
      }
    } catch (e) {
      print('🔔 FCM: Error updating preferences: $e');
      rethrow;
    }
  }

  /// Get current notification preferences
  Future<Map<String, dynamic>> getNotificationPreferences() async {
    try {
      final response = await _apiClient.get('/notifications/preferences');

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get preferences');
      }
    } catch (e) {
      print('🔔 FCM: Error getting preferences: $e');
      rethrow;
    }
  }

  /// Subscribe to topic for category-specific notifications
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
      print('🔔 FCM: Subscribed to topic: $topic');
    } catch (e) {
      print('🔔 FCM: Error subscribing to topic: $e');
    }
  }

  /// Unsubscribe from topic
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      print('🔔 FCM: Unsubscribed from topic: $topic');
    } catch (e) {
      print('🔔 FCM: Error unsubscribing from topic: $e');
    }
  }

  /// Remove FCM token (on logout)
  Future<void> removeFCMToken() async {
    try {
      final token = await _storageService.getFCMToken();
      
      if (token != null) {
        await _apiClient.delete(
          '/notifications/fcm-token',
          data: {'fcm_token': token},
        );
        
        await _storageService.clearFCMToken();
        print('🔔 FCM: Token removed from backend and local storage');
      }
    } catch (e) {
      print('🔔 FCM: Error removing token: $e');
    }
  }

  /// Get badge count
  Future<int> getBadgeCount() async {
    try {
      final response = await _apiClient.get('/notifications/badge-count');
      
      if (response.data['success'] == true) {
        return response.data['data']['count'] ?? 0;
      }
      return 0;
    } catch (e) {
      print('🔔 FCM: Error getting badge count: $e');
      return 0;
    }
  }

  /// Clear badge count
  Future<void> clearBadgeCount() async {
    try {
      await _apiClient.post('/notifications/clear-badge');
      print('🔔 FCM: Badge count cleared');
    } catch (e) {
      print('🔔 FCM: Error clearing badge: $e');
    }
  }
}

/// Background message handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('🔔 FCM: Background handler - ${message.messageId}');
  print('🔔 FCM: Title: ${message.notification?.title}');
  print('🔔 FCM: Body: ${message.notification?.body}');
  print('🔔 FCM: Data: ${message.data}');
}

/// Riverpod provider for enhanced FCM service
final enhancedFCMServiceProvider = Provider<EnhancedFCMService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final storageService = ref.watch(storageServiceProvider);
  return EnhancedFCMService(apiClient, storageService);
});

/// Provider for notification preferences
final notificationPreferencesProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final fcmService = ref.watch(enhancedFCMServiceProvider);
  return await fcmService.getNotificationPreferences();
});

/// Provider for badge count
final badgeCountProvider = FutureProvider<int>((ref) async {
  final fcmService = ref.watch(enhancedFCMServiceProvider);
  return await fcmService.getBadgeCount();
});
