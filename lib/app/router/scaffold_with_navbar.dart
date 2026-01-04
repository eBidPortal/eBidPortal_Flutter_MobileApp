import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/services/enhanced_fcm_service.dart';
import '../../features/notifications/domain/notification_model.dart';

class ScaffoldWithNavBar extends ConsumerStatefulWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends ConsumerState<ScaffoldWithNavBar> {
  StreamSubscription? _notiSub;
  @override
  void initState() {
    super.initState();
    // Listen for notification taps from FCM service
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fcmService = ref.read(enhancedFCMServiceProvider);
      _notiSub = fcmService.notificationStream.listen((data) {
        print("🔔 App: Received notification tap: $data");
        try {
          // Construct model from payload or API fetch needed?
          // Assuming payload matches model roughly or we pass basic data
          // Ideally fetch details, but for now passing payload data.
          // Note: FCM data payload is Map<String, dynamic>. Field names might differ from JSON response.
          // Adjust logic based on actual payload structure.
          
          final model = NotificationModel(
             id: data['id'] ?? data['_id'] ?? '',
             title: data['title'] ?? 'Notification',
             message: data['message'] ?? data['body'] ?? '',
             createdAt: DateTime.now(), // Payload usually lacks timestamp
             type: data['type'],
             data: data,
          );
          
          context.push('/notification-details', extra: model);
        } catch (e) {
          print("🔔 App: Error processing notification nav: $e");
        }
      });
    });
  }

  @override
  void dispose() {
    _notiSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('🏠 SCAFFOLD: Building scaffold with navbar, currentIndex: ${widget.navigationShell.currentIndex}');
    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _getBottomNavIndex(widget.navigationShell.currentIndex),
            onTap: (index) => _onTap(context, index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppTheme.primaryColor,
            unselectedItemColor: AppTheme.textMuted,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                activeIcon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                activeIcon: Icon(Icons.add_circle),
                label: 'Sell/Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.gavel_outlined),
                activeIcon: Icon(Icons.gavel),
                label: 'Auctions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
  }

  /// Convert branch index to bottom navigation index
  /// Branch indices: 0=Home, 1=Categories, 2=Auctions, 3=Profile
  /// BottomNav indices: 0=Home, 1=Categories, 2=Sell/Post, 3=Auctions, 4=Profile
  int _getBottomNavIndex(int branchIndex) {
    switch (branchIndex) {
      case 0: return 0; // Home
      case 1: return 1; // Categories
      case 2: return 3; // Auctions
      case 3: return 4; // Profile
      default: return 0; // Default to Home
    }
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    print('🏠 SCAFFOLD: Bottom nav tapped, index: $index, current branch: ${widget.navigationShell.currentIndex}');

    // Special handling for Sell/Post tab (index 2) - show auction management bottom sheet
    if (index == 2) {
      print('🏠 SCAFFOLD: Showing auction options bottom sheet');
      _showAuctionOptions(context);
      return;
    }

    // Convert bottom navigation index to branch index
    // BottomNav: 0=Home, 1=Categories, 2=Sell/Post, 3=Auctions, 4=Profile
    // Branch:    0=Home, 1=Categories, 2=Auctions, 3=Profile
    int branchIndex;
    if (index < 2) {
      branchIndex = index; // 0->0, 1->1
    } else {
      branchIndex = index - 1; // 3->2, 4->3
    }

    print('🏠 SCAFFOLD: Navigating to branch index: $branchIndex');
    
    // When navigating to a new branch, the initialLocation param of goBranch
    // ensures that we navigate to the initial location of that branch.
    widget.navigationShell.goBranch(
      branchIndex,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: branchIndex == widget.navigationShell.currentIndex,
    );

    print('🏠 SCAFFOLD: Navigation completed');
  }

  void _showAuctionOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: const EdgeInsets.all(AppTheme.spacingLg),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(AppTheme.radiusXl)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.borderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: AppTheme.spacingXl),
              Text(
                'Selling & Auctions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacingXl),
              _buildCreateOption(
                context,
                icon: Icons.sell,
                title: 'Sell Any Product',
                subtitle: 'List a product for direct sale',
                color: Colors.orange,
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/select-category?type=product');
                },
              ),
              const SizedBox(height: AppTheme.spacingMd),
              _buildCreateOption(
                context,
                icon: Icons.gavel,
                title: 'Create New Auction',
                subtitle: 'List an item for bidding',
                color: AppTheme.primaryColor,
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/select-category?type=auction');
                },
              ),
              const SizedBox(height: AppTheme.spacingMd),
              _buildCreateOption(
                context,
                icon: Icons.inventory_2,
                title: 'My Products',
                subtitle: 'Manage your direct sale listings',
                color: Colors.teal,
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/my-products');
                },
              ),
              const SizedBox(height: AppTheme.spacingMd),
              _buildCreateOption(
                context,
                icon: Icons.list_alt,
                title: 'My Auctions',
                subtitle: 'Manage your auction listings',
                color: Colors.blue,
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/my-auctions');
                },
              ),

              const SizedBox(height: AppTheme.spacingXl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreateOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Container(
          padding: const EdgeInsets.all(AppTheme.spacingLg),
          decoration: BoxDecoration(
            border: Border.all(color: color.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingMd),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppTheme.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: AppTheme.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
