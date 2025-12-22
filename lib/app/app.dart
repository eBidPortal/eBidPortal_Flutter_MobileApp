import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'router/app_router.dart';
import '../core/theme/app_theme.dart';
import 'dart:io';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  static const platform = MethodChannel('com.ebidportal.auctions/back_handler');
  bool _isAndroid = false;
  bool _isiOS = false;

  @override
  void initState() {
    super.initState();
    _isAndroid = Platform.isAndroid;
    _isiOS = Platform.isIOS;
    print('🔙 PLATFORM: Setting up native back button handler in App');
    print('🔙 PLATFORM: Running on Android: $_isAndroid, iOS: $_isiOS');

    // Set up method channel handler for both platforms
    if (_isAndroid || _isiOS) {
      platform.setMethodCallHandler(_handlePlatformCall);
      print('🔙 PLATFORM: Method channel handler registered in App');
    }
  }

  @override
  void dispose() {
    print('🔙 PLATFORM: Disposing native back button handler in App');
    platform.setMethodCallHandler(null);
    super.dispose();
  }

  Future<dynamic> _handlePlatformCall(MethodCall call) async {
    print('🔙 PLATFORM: Received method call: ${call.method} from native platform in App');
    if (call.method == 'onBackPressed') {
      print('🔙 PLATFORM: Native back button pressed (Android/iOS), handling in App');
      await _handleBackPress();
      return null;
    } else {
      print('🔙 PLATFORM: Unknown method call: ${call.method}');
    }
  }

  Future<void> _handleBackPress() async {
    print('🔙 BACK_PRESS: ===== _handleBackPress STARTED in App =====');
    final goRouter = ref.read(routerProvider);
    final currentLocation = goRouter.routerDelegate.currentConfiguration.uri.toString();

    print('🔙 BACK_PRESS: Location: $currentLocation');

    // Check if we can pop from the root navigator (for overlay screens like notifications)
    final rootNavigator = goRouter.routerDelegate.navigatorKey.currentState;
    print('🔙 BACK_PRESS: Root navigator state: $rootNavigator');
    if (rootNavigator != null && rootNavigator.canPop()) {
      print('🔙 BACK_PRESS: Root navigator can pop, popping from root navigator');
      rootNavigator.pop();
      print('🔙 BACK_PRESS: ===== _handleBackPress COMPLETED (ROOT POP) =====');
      return;
    } else {
      print('🔙 BACK_PRESS: Root navigator cannot pop or is null');
    }

    // Handle tab navigation based on current location
    // If not on home (/), navigate to home
    if (currentLocation != '/') {
      print('🔙 BACK_PRESS: Not on home location ($currentLocation), navigating to home');
      goRouter.go('/');
      print('🔙 BACK_PRESS: ===== _handleBackPress COMPLETED (GO TO HOME) =====');
      return;
    }

    // If on home, show exit confirmation
    if (currentLocation == '/') {
      print('🔙 BACK_PRESS: On home location, showing exit dialog');
      final shouldExit = await _showExitDialog();
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

  Future<bool> _showExitDialog() async {
    print('🔙 EXIT_DIALOG: Starting _showExitDialog in App');
    
    // Get the root context
    final context = ref.read(routerProvider).routerDelegate.navigatorKey.currentContext;
    if (context == null) {
      print('🔙 EXIT_DIALOG: No context available, defaulting to exit');
      return true;
    }
    
    try {
      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Exit'),
              ),
            ],
          );
        },
      );
      print('🔙 EXIT_DIALOG: Dialog result: $result');
      return result ?? false;
    } catch (e) {
      print('🔙 EXIT_DIALOG: Error showing dialog: $e, defaulting to exit');
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return ToastificationWrapper(
      child: MaterialApp.router(
        title: 'eBidPortal',
        theme: AppTheme.lightTheme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
