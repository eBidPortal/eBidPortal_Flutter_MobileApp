import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import '../../../core/services/fcm_service.dart';
import '../../../core/storage/storage_service.dart';
import '../../auth/presentation/auth_provider.dart';

part 'splash_provider.g.dart';

enum InitializationStatus {
  initializing,
  firebaseInitialized,
  initializingMessaging,
  initializingAnalytics,
  checkingAuth,
  tokenRefreshed,
  completed,
  error,
}

@Riverpod(keepAlive: true)
class Splash extends _$Splash {
  @override
  FutureOr<InitializationStatus> build() async {
    return InitializationStatus.initializing;
  }

  Future<void> initialize() async {
    try {
      // Step 1: Firebase Core is already initialized in main.dart
      state = const AsyncValue.data(InitializationStatus.firebaseInitialized);
      await Future.delayed(const Duration(milliseconds: 300));

      // Step 2: Initialize Firebase Messaging
      state = const AsyncValue.data(InitializationStatus.initializingMessaging);
      await _initializeFirebaseMessaging();
      await Future.delayed(const Duration(milliseconds: 300));

      // Step 3: Initialize Firebase Analytics
      state = const AsyncValue.data(InitializationStatus.initializingAnalytics);
      await _initializeFirebaseAnalytics();
      await Future.delayed(const Duration(milliseconds: 300));

      // Step 4: Check authentication and refresh token if needed
      state = const AsyncValue.data(InitializationStatus.checkingAuth);
      await _checkAndRefreshAuth();

      // Step 5: Mark as completed
      state = const AsyncValue.data(InitializationStatus.completed);
      
      // Small delay to show completion
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> _initializeFirebaseMessaging() async {
    try {
      final fcmService = ref.read(fcmServiceProvider);

      // Request notification permissions
      final hasPermission = await fcmService.requestPermission();

      if (hasPermission) {
        // Check if user is authenticated before registering FCM token
        final authState = ref.read(authProvider);
        final isAuthenticated = authState.maybeWhen(
          data: (user) => user != null,
          orElse: () => false,
        );

        if (isAuthenticated) {
          // Only register FCM token if user is authenticated
          final registered = await fcmService.registerToken();
          if (registered) {
            print('FCM token registered successfully with backend');
          } else {
            print('Failed to register FCM token with backend');
          }
        } else {
          print('User not authenticated, skipping FCM token registration');
        }

        // Setup token refresh listener (always setup, even if not authenticated)
        fcmService.setupTokenRefreshListener();

        // Handle foreground messages
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          print('Got a message whilst in the foreground!');
          print('Message data: ${message.data}');

          if (message.notification != null) {
            print('Message also contained a notification: ${message.notification}');
          }
        });
      }
    } catch (e) {
      print('Error initializing Firebase Messaging: $e');
      // Don't throw - messaging is not critical for app to function
    }
  }

  Future<void> _initializeFirebaseAnalytics() async {
    try {
      final analytics = FirebaseAnalytics.instance;
      
      // Log app open event
      await analytics.logAppOpen();
      
      // Set analytics collection enabled
      await analytics.setAnalyticsCollectionEnabled(true);
    } catch (e) {
      print('Error initializing Firebase Analytics: $e');
      // Don't throw - analytics is not critical for app to function
    }
  }

  Future<void> _checkAndRefreshAuth() async {
    final storage = ref.read(storageServiceProvider);
    final token = await storage.getToken();

    if (token != null) {
      // Token exists, verify it's still valid
      try {
        // This will automatically validate the token by fetching user data
        await ref.read(authProvider.future);
        
        // Update status to token refreshed
        state = const AsyncValue.data(InitializationStatus.tokenRefreshed);
        await Future.delayed(const Duration(milliseconds: 300));
      } catch (e) {
        // Token is invalid or expired, clear it
        await storage.clearToken();
        // Auth provider will be null, user will be redirected to login
      }
    }
  }
}
