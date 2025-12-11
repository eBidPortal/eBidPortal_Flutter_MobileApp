import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final String? type; // 'bid', 'auction_ended', 'system', etc.

  const NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
    this.type,
  });

  NotificationItem copyWith({
    String? id,
    String? title,
    String? message,
    DateTime? timestamp,
    bool? isRead,
    String? type,
  }) {
    return NotificationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
    );
  }
}

class NotificationService {
  // Mock data for now - in real app, this would come from API
  List<NotificationItem> getMockNotifications() {
    return [
      NotificationItem(
        id: '1',
        title: 'New Bid Received',
        message: 'Someone placed a bid on your Rolex auction',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        isRead: false,
        type: 'bid',
      ),
      NotificationItem(
        id: '2',
        title: 'Auction Ending Soon',
        message: 'Your iPhone auction ends in 1 hour',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: false,
        type: 'auction_ending',
      ),
      NotificationItem(
        id: '3',
        title: 'Welcome to eBidPortal',
        message: 'Thanks for joining! Start exploring auctions now.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        type: 'system',
      ),
    ];
  }

  int getUnreadCount(List<NotificationItem> notifications) {
    return notifications.where((n) => !n.isRead).length;
  }
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final notificationsProvider = StateNotifierProvider<NotificationNotifier, List<NotificationItem>>((ref) {
  final service = ref.watch(notificationServiceProvider);
  return NotificationNotifier(service);
});

class NotificationNotifier extends StateNotifier<List<NotificationItem>> {
  final NotificationService _service;

  NotificationNotifier(this._service) : super([]) {
    loadNotifications();
  }

  void loadNotifications() {
    state = _service.getMockNotifications();
  }

  void markAsRead(String notificationId) {
    state = state.map((notification) {
      if (notification.id == notificationId) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();
  }

  void markAllAsRead() {
    state = state.map((notification) => notification.copyWith(isRead: true)).toList();
  }

  int get unreadCount => _service.getUnreadCount(state);
}