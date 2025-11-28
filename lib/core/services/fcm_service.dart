import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../storage/storage_service.dart';

final fcmServiceProvider = Provider<FCMService>((ref) {
  return FCMService(ref.read(storageServiceProvider));
});

class FCMService {
  final StorageService _storage;
  
  FCMService(this._storage);
  
  static const String _fcmTokenKey = 'fcm_token';

  /// Get the current FCM token
  Future<String?> getToken() async {
    try {
      final messaging = FirebaseMessaging.instance;
      return await messaging.getToken();
    } catch (e) {
      print('Error getting FCM token: $e');
      return null;
    }
  }

  /// Save FCM token to local storage
  Future<void> saveToken(String token) async {
    // You can save to local storage if needed
    // Or send to your backend server
    print('Saving FCM token: $token');
    // TODO: Send token to backend API
  }

  /// Handle token refresh
  void setupTokenRefreshListener() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print('FCM Token refreshed: $newToken');
      saveToken(newToken);
    });
  }

  /// Request notification permissions
  Future<bool> requestPermission() async {
    try {
      final messaging = FirebaseMessaging.instance;
      
      final settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      return settings.authorizationStatus == AuthorizationStatus.authorized ||
             settings.authorizationStatus == AuthorizationStatus.provisional;
    } catch (e) {
      print('Error requesting notification permission: $e');
      return false;
    }
  }
}
