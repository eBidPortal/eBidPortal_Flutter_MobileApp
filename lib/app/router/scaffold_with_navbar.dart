import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  static const platform = MethodChannel('com.ebidportal.auctions/back_handler');
  bool _isAndroid = false;
  bool _isiOS = false;
  bool _hasNavigatedToHome = false;

  @override
  void initState() {
    super.initState();
    _isAndroid = Platform.isAndroid;
    _isiOS = Platform.isIOS;
    print('🔙 PLATFORM: Setting up native back button handler');
    print('🔙 PLATFORM: Running on Android: $_isAndroid, iOS: $_isiOS');
    
    // Set up method channel handler for both platforms
    if (_isAndroid || _isiOS) {
      platform.setMethodCallHandler(_handlePlatformCall);
      print('🔙 PLATFORM: Method channel handler registered');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('🔙 PLATFORM: didChangeDependencies called');
  }

  @override
  void dispose() {
    print('🔙 PLATFORM: Disposing native back button handler');
    platform.setMethodCallHandler(null);
    super.dispose();
  }

  Future<dynamic> _handlePlatformCall(MethodCall call) async {
    print('🔙 PLATFORM: Received method call: ${call.method} from native platform');
    if (call.method == 'onBackPressed') {
      print('🔙 PLATFORM: Native back button pressed (Android/iOS), handling in Flutter');
      await _handleBackPress(context);
      return null;
    } else {
      print('🔙 PLATFORM: Unknown method call: ${call.method}');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('🏠 SCAFFOLD: Building scaffold with navbar, currentIndex: ${widget.navigationShell.currentIndex}');
    print('🏠 SCAFFOLD: Creating WillPopScope for back button handling');
    return WillPopScope(
      onWillPop: () async {
        print('🔙 WILL_POP: onWillPop called');
        await _handleBackPress(context);
        return false; // Always prevent default back behavior
      },
      child: Scaffold(
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
    
    // Reset navigation state when user manually taps on home tab
    if (branchIndex == 0) {
      _hasNavigatedToHome = false;
      print('🏠 SCAFFOLD: Reset _hasNavigatedToHome to false (manual home tap)');
    }

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
                'Auction Management',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacingXl),
              _buildCreateOption(
                context,
                icon: Icons.gavel,
                title: 'Create New Auction',
                subtitle: 'List an item for bidding',
                color: AppTheme.primaryColor,
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/select-category');
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
              const SizedBox(height: AppTheme.spacingMd),
              _buildCreateOption(
                context,
                icon: Icons.search,
                title: 'Browse All Auctions',
                subtitle: 'Search and filter live auctions',
                color: Colors.green,
                onTap: () {
                  Navigator.of(context).pop();
                  widget.navigationShell.goBranch(2); // Go to auctions tab
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

  Future<void> _handleBackPress(BuildContext context) async {
    print('🔙 BACK_PRESS: ===== _handleBackPress STARTED =====');
    final goRouter = GoRouter.of(context);
    final currentLocation = goRouter.routerDelegate.currentConfiguration.uri.toString();
    final currentIndex = widget.navigationShell.currentIndex;
    
    print('🔙 BACK_PRESS: Location: $currentLocation, Tab index: $currentIndex');
    print('🔙 BACK_PRESS: Context mounted: ${context.mounted}');

    // Check if we can pop from the root navigator (for overlay screens)
    final rootNavigator = goRouter.routerDelegate.navigatorKey.currentState;
    print('🔙 BACK_PRESS: Root navigator state: $rootNavigator');
    if (rootNavigator != null && rootNavigator.canPop()) {
      print('🔙 BACK_PRESS: Root navigator can pop, popping from root navigator');
      Navigator.of(context).pop();
      print('🔙 BACK_PRESS: ===== _handleBackPress COMPLETED (ROOT POP) =====');
      return;
    } else {
      print('🔙 BACK_PRESS: Root navigator cannot pop or is null');
    }

    // Handle tab navigation
    // Tab indices: 0=Home, 1=Categories, 2=Sell/Post, 3=Auctions, 4=Profile
    if (currentIndex != 0) {
      // If not on Home tab, navigate to Home
      print('🔙 BACK_PRESS: Not on home tab (currentIndex=$currentIndex), navigating to home');
      _hasNavigatedToHome = true;
      widget.navigationShell.goBranch(0);
      print('🔙 BACK_PRESS: Set _hasNavigatedToHome=true and navigated to home');
      
      // Add a small delay and then notify Android to re-register callback
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_isAndroid) {
          platform.invokeMethod('reRegisterCallback');
        }
      });
      
      print('🔙 BACK_PRESS: ===== _handleBackPress COMPLETED (GO TO HOME) =====');
      return;
    }

    // If on Home tab, show exit confirmation
    if (currentIndex == 0) {
      print('🔙 BACK_PRESS: On home tab (currentIndex=0), _hasNavigatedToHome=$_hasNavigatedToHome');
      
      // Reset the navigation flag before showing dialog
      _hasNavigatedToHome = false;
      
      print('🔙 BACK_PRESS: About to call _showExitDialog');
      final shouldExit = await _showExitDialog(context);
      print('🔙 BACK_PRESS: _showExitDialog returned: $shouldExit');
      
      if (shouldExit) {
        print('🔙 BACK_PRESS: User confirmed exit, closing app');
        SystemNavigator.pop();
      } else {
        print('🔙 BACK_PRESS: User cancelled exit, staying in app');
      }
      print('🔙 BACK_PRESS: ===== _handleBackPress COMPLETED (EXIT DIALOG) =====');
      return;
    }
    
    print('🔙 BACK_PRESS: ===== _handleBackPress COMPLETED (NO ACTION) =====');
  }

  Future<bool> _showExitDialog(BuildContext context) async {
    print('🔙 EXIT_DIALOG: Starting _showExitDialog');
    print('🔙 EXIT_DIALOG: Context mounted: ${context.mounted}');
    
    try {
      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          print('🔙 EXIT_DIALOG: Building dialog widget');
          return AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () {
                  print('🔙 EXIT_DIALOG: User pressed Cancel');
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  print('🔙 EXIT_DIALOG: User pressed Exit');
                  Navigator.of(context).pop(true);
                },
                child: const Text('Exit'),
              ),
            ],
          );
        },
      );
      
      print('🔙 EXIT_DIALOG: Dialog result: $result');
      return result ?? false;
    } catch (e) {
      print('🔙 EXIT_DIALOG: Error showing dialog: $e');
      return false;
    }
  }
}
