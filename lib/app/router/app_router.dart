import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import '../../features/auth/presentation/auth_provider.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/home/presentation/search_screen.dart';
import '../../features/catalog/presentation/category_screen.dart';
import '../../features/auction/presentation/all_auctions_screen.dart';
import '../../features/auction/presentation/my_auctions_screen.dart';
import '../../features/auction/presentation/auction_details_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/notifications/presentation/notifications_screen.dart';
import '../../features/catalog/domain/category.dart';
import '../../features/auction/presentation/create_auction/create_auction_screen.dart';
import '../../features/auction/presentation/create_auction/widgets/category_selection_screen.dart';
import '../../features/auction/presentation/create_auction/widgets/category_schema_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'scaffold_with_navbar.dart';

class CustomBackButtonDispatcher extends BackButtonDispatcher {
  final GlobalKey<NavigatorState> _navigatorKey;

  CustomBackButtonDispatcher(this._navigatorKey);

  @override
  Future<bool> didPopRoute() async {
    print('🔙 BACK_DISPATCHER: Back button pressed!');

    // Get the current context from the navigator
    final context = _navigatorKey.currentContext;
    if (context == null) {
      print('🔙 BACK_DISPATCHER: Context is null, cannot handle back press');
      return false;
    }

    final goRouter = GoRouter.of(context);
    final currentLocation = goRouter.routerDelegate.currentConfiguration.uri.toString();
    print('🔙 BACK_DISPATCHER: Current location: $currentLocation');

    // Check if we can pop from the current navigator
    final navigator = Navigator.of(context);
    final canPop = navigator.canPop();
    print('🔙 BACK_DISPATCHER: Navigator can pop: $canPop');

    // Check if we're on the home screen (main shell route)
    final isOnHomeScreen = currentLocation == '/home' || currentLocation == '/' || currentLocation.startsWith('/home');
    print('🔙 BACK_DISPATCHER: Is on home screen: $isOnHomeScreen');

    if (canPop) {
      print('🔙 BACK_DISPATCHER: Navigator can pop, popping from current navigator...');
      navigator.pop();
      return true; // Handled the back press
    } else {
      print('🔙 BACK_DISPATCHER: Navigator cannot pop, checking current location...');

      // If we're on a specific route that should navigate back to home
      if (currentLocation.contains('/categories') ||
          currentLocation.contains('/auctions') ||
          currentLocation.contains('/profile') ||
          currentLocation.contains('/auction-details') ||
          currentLocation.contains('/create-auction') ||
          currentLocation.contains('/search')) {
        print('🔙 BACK_DISPATCHER: On sub-route, navigating to home...');
        goRouter.go('/home');
        return true;
      }

      // If we're on home or a home-related route, show exit confirmation
      if (isOnHomeScreen) {
        print('🔙 BACK_DISPATCHER: On home screen, showing exit confirmation');
        final shouldExit = await _showExitConfirmationDialog(context);
        if (shouldExit) {
          print('🔙 BACK_DISPATCHER: User confirmed exit, closing app');
          SystemNavigator.pop();
          return true; // Handled the back press
        } else {
          print('🔙 BACK_DISPATCHER: User cancelled exit');
          return true; // Don't allow system to handle (prevent closing)
        }
      }

      // Default: show exit confirmation
      print('🔙 BACK_DISPATCHER: Unknown location, showing exit confirmation');
      final shouldExit = await _showExitConfirmationDialog(context);
      if (shouldExit) {
        SystemNavigator.pop();
        return true;
      }
      return true;
    }
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
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
    ) ?? false;
  }
}

class AuthListenable extends ChangeNotifier {
  AuthListenable(Stream<void> stream) {
    stream.listen((_) => notifyListeners());
  }
}

final authListenableProvider = Provider<AuthListenable>((ref) {
  // Create a stream that emits when auth state changes
  final streamController = StreamController<void>.broadcast();

  // Listen to auth provider changes
  ref.listen(authProvider, (previous, next) {
    streamController.add(null); // Emit on any auth state change
  });

  // Create the listenable
  final listenable = AuthListenable(streamController.stream);

  // Clean up the controller when the provider is disposed
  ref.onDispose(() {
    streamController.close();
  });

  return listenable;
});

final rootNavigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

final routerProvider = Provider<GoRouter>((ref) {
  print('🧭 ROUTER: Creating router provider...');

  final rootNavigatorKey = ref.watch(rootNavigatorKeyProvider);
  final shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  final shellNavigatorCategoriesKey = GlobalKey<NavigatorState>(debugLabel: 'shellCategories');
  final shellNavigatorAuctionsKey = GlobalKey<NavigatorState>(debugLabel: 'shellAuctions');
  final shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  print('🧭 ROUTER: Navigator keys created successfully');

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    refreshListenable: ref.watch(authListenableProvider),
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isSplashScreen = state.uri.path == '/splash';
      final isLoginScreen = state.uri.path == '/login';
      final isLoggedIn = authState.value != null;
      final isAuthLoading = authState.isLoading;

      print('🧭 ROUTER: Redirect check - Path: ${state.uri.path}, AuthLoading: $isAuthLoading, LoggedIn: $isLoggedIn');

      // Don't redirect while auth is loading
      if (isAuthLoading) {
        print('🧭 ROUTER: Auth loading, staying on current path');
        return null;
      }

      // Allow splash screen to show initially
      if (isSplashScreen) {
        print('🧭 ROUTER: On splash screen, allowing access');
        return null;
      }

      // After splash, handle auth-based routing
      if (!isLoggedIn && !isLoginScreen) {
        print('🧭 ROUTER: Not logged in, redirecting to login');
        return '/login';
      }
      if (isLoggedIn && isLoginScreen) {
        print('🧭 ROUTER: Logged in on login screen, redirecting to home');
        return '/home';
      }

      print('🧭 ROUTER: No redirect needed');
      return null;
    },
    onException: (context, state, router) {
      print('🧭 ROUTER: Exception occurred - ${state.error}');
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      // StatefulShellRoute for persistent bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          print('🏠 SHELL: Building StatefulShellRoute, currentIndex: ${navigationShell.currentIndex}');
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Home Branch
          StatefulShellBranch(
            navigatorKey: shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // Categories Branch
          StatefulShellBranch(
            navigatorKey: shellNavigatorCategoriesKey,
            routes: [
              GoRoute(
                path: '/categories',
                builder: (context, state) => const CategoryScreen(),
              ),
            ],
          ),
          // Auctions Branch
          StatefulShellBranch(
            navigatorKey: shellNavigatorAuctionsKey,
            routes: [
              GoRoute(
                path: '/auctions',
                name: 'auctions',
                builder: (context, state) {
                  final categoryId = state.uri.queryParameters['categoryId'];
                  return AllAuctionsScreen(categoryId: categoryId);
                },
                routes: [
                  GoRoute(
                    path: ':auctionId',
                    name: 'auction-detail',
                    parentNavigatorKey: rootNavigatorKey, // Hide bottom nav
                    builder: (context, state) {
                      final auctionId = state.pathParameters['auctionId']!;
                      return AuctionDetailsScreen(auctionId: auctionId);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Profile Branch
          StatefulShellBranch(
            navigatorKey: shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      // Routes that should cover the bottom nav bar (root navigator)
      GoRoute(
        path: '/select-category',
        name: 'select-category',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const CategorySelectionScreen(),
      ),
      GoRoute(
        path: '/category-schema',
        name: 'category-schema',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final category = state.extra as Category?;
          if (category == null) {
            // Fallback if no category provided
            return const CategorySelectionScreen();
          }
          return CategorySchemaScreen(category: category);
        },
      ),
      GoRoute(
        path: '/create-auction',
        name: 'create-auction',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final category = state.extra as Category?;
          return CreateAuctionScreen(initialCategory: category);
        },
      ),
      // My Auctions Management
      GoRoute(
        path: '/my-auctions',
        name: 'my-auctions',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const MyAuctionsScreen(),
      ),
      // Auction Search
      GoRoute(
        path: '/auction-search',
        name: 'auction-search',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          return const AllAuctionsScreen();
        },
      ),
      // Notifications
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const NotificationsScreen(),
      ),
    ],
  );

  return router;
});
