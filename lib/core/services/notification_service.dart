import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/notifications/data/notification_repository.dart';
import '../../features/notifications/domain/notification_model.dart';

export '../../features/notifications/domain/notification_model.dart';

// Alias for backward compatibility during refactor (though properties differ)
typedef NotificationItem = NotificationModel;

final notificationsProvider = StateNotifierProvider<NotificationNotifier, List<NotificationModel>>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return NotificationNotifier(repository);
});

class NotificationNotifier extends StateNotifier<List<NotificationModel>> {
  final NotificationRepository _repository;

  NotificationNotifier(this._repository) : super([]) {
    refreshNotifications();
  }

  Future<void> refreshNotifications() async {
    try {
      final notifications = await _repository.getNotifications();
      state = notifications;
    } catch (e) {
      print('Failed to refresh notifications: $e');
    }
  }

  Future<void> markAsRead(String id) async {
    // Optimistic update
    state = state.map((n) {
      if (n.id == id) return n.copyWith(isRead: true);
      return n;
    }).toList();

    try {
      await _repository.markAsRead(id);
    } catch (e) {
      // Revert if failed (optional, but good practice)
      print('Failed to mark as read: $e');
    }
  }

  Future<void> markAllAsRead() async {
    state = state.map((n) => n.copyWith(isRead: true)).toList();
    try {
      await _repository.markAllAsRead();
    } catch (e) {
      print('Failed to mark all as read: $e');
    }
  }

  int get unreadCount => state.where((n) => !n.isRead).length;
}