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

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
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
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'categories',
            builder: (context, state) => const CategoryScreen(),
          ),
        ],
      ),
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
            builder: (context, state) {
              final auctionId = state.pathParameters['auctionId']!;
              return AuctionDetailScreen(auctionId: auctionId);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/create-auction',
        name: 'create-auction',
        builder: (context, state) => const CreateAuctionScreen(),
      ),
      GoRoute(
        path: '/watchlist',
        name: 'watchlist',
        builder: (context, state) => const WatchlistScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
});
