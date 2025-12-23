import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

class NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepository(this._apiClient);

  /// Register FCM token with the backend
  Future<Map<String, dynamic>> registerFCMToken({
    required String fcmToken,
    String? platform,
    String? deviceType,
    String? deviceName,
    String? appVersion,
  }) async {
    try {
      final requestBody = {
        'fcm_token': fcmToken,
        if (platform != null) 'platform': platform,
        if (deviceType != null) 'device_type': deviceType,
        if (deviceName != null) 'device_name': deviceName,
        if (appVersion != null) 'app_version': appVersion,
      };

      final response = await _apiClient.post(
        ApiConstants.fcmToken,
        data: requestBody,
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to register FCM token: $e');
    }
  }

  /// Remove FCM token from the backend
  Future<Map<String, dynamic>> removeFCMToken(String fcmToken) async {
    try {
      final response = await _apiClient.delete(
        ApiConstants.fcmToken,
        data: {'fcm_token': fcmToken},
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to remove FCM token: $e');
    }
  }
}

// Provider for NotificationRepository
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return NotificationRepository(apiClient);
});