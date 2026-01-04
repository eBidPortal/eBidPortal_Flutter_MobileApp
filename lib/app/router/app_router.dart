import 'dart:async';
import 'package:flutter/material.dart';
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
import '../../features/profile/presentation/addresses_screen.dart';
import '../../features/profile/presentation/add_edit_address_screen.dart';
import '../../features/profile/presentation/security_screen.dart';
import '../../features/profile/presentation/help_support_screen.dart';
import '../../features/profile/presentation/personal_information_screen.dart';
import '../../features/profile/presentation/purchase_history_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/notifications/presentation/notifications_screen.dart';
import '../../features/catalog/domain/category.dart';
import '../../features/auction/presentation/create_auction/create_auction_screen.dart';
import '../../features/auction/presentation/create_auction/widgets/category_selection_screen.dart';
import '../../features/auction/presentation/create_auction/widgets/category_schema_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/auction/presentation/watchlist/watchlist_screen.dart';
import '../../features/product/presentation/create_product/create_product_screen.dart';
import '../../features/product/presentation/my_products/my_products_screen.dart';
import 'scaffold_with_navbar.dart';

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
      GoRoute(
        path: '/home',
        redirect: (context, state) => '/',
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
                routes: [
                  GoRoute(
                    path: 'watchlist',
                    name: 'watchlist',
                    builder: (context, state) => const WatchlistScreen(),
                  ),
                  GoRoute(
                    path: 'addresses',
                    name: 'addresses',
                    builder: (context, state) => const AddressesScreen(),
                    routes: [
                      GoRoute(
                        path: 'add',
                        name: 'add-address',
                        builder: (context, state) => const AddEditAddressScreen(),
                      ),
                      GoRoute(
                        path: ':addressId/edit',
                        name: 'edit-address',
                        builder: (context, state) {
                          final addressId = state.pathParameters['addressId']!;
                          return AddEditAddressScreen(addressId: addressId);
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'security',
                    name: 'security',
                    builder: (context, state) => const SecurityScreen(),
                  ),
                  GoRoute(
                    path: 'help-support',
                    name: 'help-support',
                    builder: (context, state) => const HelpSupportScreen(),
                  ),
                  GoRoute(
                    path: 'personal-information',
                    name: 'personal-information',
                    builder: (context, state) => const PersonalInformationScreen(),
                  ),
                  GoRoute(
                    path: 'purchase-history',
                    name: 'purchase-history',
                    builder: (context, state) => const PurchaseHistoryScreen(),
                  ),
                ],
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
        path: '/category-auctions',
        name: 'category-auctions',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final categoryId = state.uri.queryParameters['categoryId'];
          return AllAuctionsScreen(categoryId: categoryId);
        },
        routes: [
          GoRoute(
            path: ':auctionId',
            name: 'category-auction-detail',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) {
              final auctionId = state.pathParameters['auctionId']!;
              return AuctionDetailsScreen(auctionId: auctionId);
            },
          ),
        ],
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
      // My Products Management
      GoRoute(
        path: '/my-products',
        name: 'my-products',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const MyProductsScreen(),
      ),
      GoRoute(
        path: '/create-product',
        name: 'create-product',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final category = state.extra as Category?;
          return CreateProductScreen(initialCategory: category);
        },
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
