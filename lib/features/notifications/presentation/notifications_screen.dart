import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/services/notification_service.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);
    final notifier = ref.read(notificationsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
        actions: [
          if (notifications.isNotEmpty)
            TextButton(
              onPressed: () => notifier.markAllAsRead(),
              child: Text(
                'Mark all read',
                style: TextStyle(color: AppTheme.primaryColor),
              ),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? _buildEmptyState()
          : _buildNotificationsList(context, notifications, notifier),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 64,
            color: AppTheme.textMuted,
          ),
          const SizedBox(height: AppTheme.spacingMd),
          Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 18,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            'You\'ll see updates about your auctions here',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(
    BuildContext context,
    List<NotificationItem> notifications,
    NotificationNotifier notifier,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationItem(context, notification, notifier);
      },
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    NotificationItem notification,
    NotificationNotifier notifier,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingSm),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        side: BorderSide(color: AppTheme.borderColor),
      ),
      child: InkWell(
        onTap: () {
          if (!notification.isRead) {
            notifier.markAsRead(notification.id);
          }
          // Handle navigation based on notification type
          _handleNotificationTap(context, notification);
        },
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNotificationIcon(notification.type),
              const SizedBox(width: AppTheme.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontWeight: notification.isRead
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        if (!notification.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spacingXs),
                    Text(
                      notification.message,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingSm),
                    Text(
                      _formatTimestamp(notification.createdAt),
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon(String? type) {
    IconData iconData;
    Color iconColor;

    switch (type) {
      case 'bid':
        iconData = Icons.gavel;
        iconColor = Colors.green;
        break;
      case 'auction_ending':
        iconData = Icons.timer;
        iconColor = Colors.orange;
        break;
      case 'system':
        iconData = Icons.info;
        iconColor = AppTheme.primaryColor;
        break;
      default:
        iconData = Icons.notifications;
        iconColor = AppTheme.textMuted;
    }

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingSm),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 20,
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return DateFormat('MMM d').format(timestamp);
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  void _handleNotificationTap(BuildContext context, NotificationItem notification) {
    context.push('/notification-details', extra: notification);
  }
}