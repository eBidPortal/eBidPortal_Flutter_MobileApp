import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/auth_provider.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/catalog/presentation/category_screen.dart';
import '../../features/auction/presentation/auction_list_screen.dart';
import '../../features/auction/presentation/auction_detail_screen.dart';
import '../../features/auction/presentation/watchlist_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/auction/presentation/create_auction/create_auction_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'scaffold_with_navbar.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  final shellNavigatorCategoriesKey = GlobalKey<NavigatorState>(debugLabel: 'shellCategories');
  final shellNavigatorAuctionsKey = GlobalKey<NavigatorState>(debugLabel: 'shellAuctions');
  final shellNavigatorWatchlistKey = GlobalKey<NavigatorState>(debugLabel: 'shellWatchlist');
  final shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      final isSplashScreen = state.uri.path == '/splash';
      final isLoginScreen = state.uri.path == '/login';
      final isLoggedIn = authState.value != null;

      // Allow splash screen to show initially
      if (isSplashScreen) {
        return null;
      }

      // After splash, handle auth-based routing
      if (!isLoggedIn && !isLoginScreen) {
        return '/login';
      }
      if (isLoggedIn && isLoginScreen) {
        return '/';
      }

      return null;
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
      // StatefulShellRoute for persistent bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
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
                  final search = state.uri.queryParameters['search'];
                  return AuctionListScreen(
                    categoryId: categoryId,
                    search: search,
                  );
                },
                routes: [
                  GoRoute(
                    path: ':auctionId',
                    name: 'auction-detail',
                    parentNavigatorKey: rootNavigatorKey, // Hide bottom nav
                    builder: (context, state) {
                      final auctionId = state.pathParameters['auctionId']!;
                      return AuctionDetailScreen(auctionId: auctionId);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Watchlist Branch
          StatefulShellBranch(
            navigatorKey: shellNavigatorWatchlistKey,
            routes: [
              GoRoute(
                path: '/watchlist',
                name: 'watchlist',
                builder: (context, state) => const WatchlistScreen(),
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
        path: '/create-auction',
        name: 'create-auction',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const CreateAuctionScreen(),
      ),
    ],
  );
});
