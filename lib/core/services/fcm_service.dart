import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../storage/storage_service.dart';
import '../../features/notifications/data/notification_repository.dart';

final fcmServiceProvider = Provider<FCMService>((ref) {
  return FCMService(
    ref.read(storageServiceProvider),
    ref.read(notificationRepositoryProvider),
  );
});

class FCMService {
  final StorageService _storage;
  final NotificationRepository _notificationRepository;

  FCMService(this._storage, this._notificationRepository);

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

  /// Check if FCM token is already registered
  Future<bool> isTokenRegistered() async {
    final storedToken = await _storage.getString(_fcmTokenKey);
    return storedToken != null && storedToken.isNotEmpty;
  }

  /// Register FCM token with backend API
  Future<bool> registerToken({
    String? platform,
    String? deviceName,
    String? appVersion,
  }) async {
    try {
      final token = await getToken();
      if (token == null) {
        print('No FCM token available to register');
        return false;
      }

      // Get device info if not provided
      final deviceInfo = await _getDeviceInfo();
      final deviceType = platform ?? deviceInfo['platform'] ?? 'Unknown';
      final deviceNameFinal = deviceName ?? deviceInfo['deviceName'] ?? 'Unknown Device';
      final appVersionFinal = appVersion ?? '1.0.0'; // You can get this from package_info_plus

      final response = await _notificationRepository.registerFCMToken(
        fcmToken: token,
        platform: deviceType,
        deviceName: deviceNameFinal,
        appVersion: appVersionFinal,
      );

      // Check if registration was successful based on response
      if (response['success'] == true) {
        // Save token locally for tracking
        await _storage.saveString(_fcmTokenKey, token);

        print('FCM token registered successfully: ${response['message']}');
        return true;
      } else {
        print('FCM token registration failed: ${response['message']}');
        return false;
      }
    } catch (e) {
      print('Error registering FCM token: $e');
      return false;
    }
  }

  /// Remove FCM token from backend API
  Future<bool> removeToken() async {
    try {
      final token = await _storage.getString(_fcmTokenKey);
      if (token == null) {
        print('No stored FCM token to remove');
        return false;
      }

      final response = await _notificationRepository.removeFCMToken(token);

      // Check if removal was successful based on response
      if (response['success'] == true) {
        // Remove from local storage
        await _storage.remove(_fcmTokenKey);

        print('FCM token removed successfully: ${response['message']}');
        return true;
      } else {
        print('FCM token removal failed: ${response['message']}');
        return false;
      }
    } catch (e) {
      print('Error removing FCM token: $e');
      return false;
    }
  }

  /// Handle token refresh - automatically re-register with backend
  void setupTokenRefreshListener() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      print('FCM Token refreshed: $newToken');

      try {
        // Remove old token if exists
        await removeToken();

        // Register new token with backend
        final deviceInfo = await _getDeviceInfo();
        final deviceType = deviceInfo['platform'] ?? 'Unknown';
        final deviceName = deviceInfo['deviceName'] ?? 'Unknown Device';
        const appVersion = '1.0.0'; // You can get this from package_info_plus

        final response = await _notificationRepository.registerFCMToken(
          fcmToken: newToken,
          platform: deviceType,
          deviceName: deviceName,
          appVersion: appVersion,
        );

        if (response['success'] == true) {
          // Save new token locally
          await _storage.saveString(_fcmTokenKey, newToken);
          print('New FCM token registered successfully after refresh');
        } else {
          print('Failed to register new FCM token after refresh: ${response['message']}');
        }
      } catch (e) {
        print('Error handling FCM token refresh: $e');
      }
    });
  }

  /// Get device information for token registration
  Future<Map<String, String>> _getDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final info = await deviceInfo.deviceInfo;

      late String platform;
      late String deviceName;

      if (info is AndroidDeviceInfo) {
        platform = 'Android';
        deviceName = '${info.brand} ${info.model}';
      } else if (info is IosDeviceInfo) {
        platform = 'iOS';
        deviceName = info.name ?? 'iOS Device';
      } else {
        // For web or other platforms
        platform = 'Web';
        deviceName = 'Web Browser';
      }

      return {
        'platform': platform,
        'deviceName': deviceName,
      };
    } catch (e) {
      print('Error getting device info: $e');
      return {
        'platform': 'Android', // Default to Android as per documentation
        'deviceName': 'Unknown Device',
      };
    }
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
