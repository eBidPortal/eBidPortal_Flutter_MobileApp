import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/notification_model.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

class NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepository(this._apiClient);

  /// Fetch user notifications
  Future<List<NotificationModel>> getNotifications({int page = 1, int limit = 20}) async {
    try {
      final response = await _apiClient.get(
        '/notifications',
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.data['success'] == true) {
        final list = response.data['data']['notifications'] as List;
        return list.map((e) => NotificationModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      // Return empty list on error for now, or rethrow if important
      print('Error fetching notifications: $e');
      return [];
    }
  }

  /// Mark notification as read
  Future<void> markAsRead(String id) async {
    try {
      await _apiClient.patch('/notifications/read/$id');
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead() async {
    try {
      await _apiClient.patch('/notifications/mark-all-read');
    } catch (e) {
      print('Error marking all notifications as read: $e');
    }
  }

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