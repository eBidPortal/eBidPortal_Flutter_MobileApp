import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../../auction/domain/auction.dart';
import '../../catalog/domain/category.dart';
import '../../auth/presentation/auth_provider.dart';
import '../data/home_service.dart';

// Service Provider
final homeServiceProvider = Provider<HomeService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return HomeService(apiClient);
});

// State Classes
class HomeData {
  final List<Auction> featuredAuctions;
  final List<Auction> endingSoonAuctions;
  final List<Category> trendingCategories;
  final Map<String, dynamic> stats;
  final bool isLoading;
  final String? error;

  HomeData({
    required this.featuredAuctions,
    required this.endingSoonAuctions,
    required this.trendingCategories,
    required this.stats,
    this.isLoading = false,
    this.error,
  });

  HomeData copyWith({
    List<Auction>? featuredAuctions,
    List<Auction>? endingSoonAuctions,
    List<Category>? trendingCategories,
    Map<String, dynamic>? stats,
    bool? isLoading,
    String? error,
  }) {
    return HomeData(
      featuredAuctions: featuredAuctions ?? this.featuredAuctions,
      endingSoonAuctions: endingSoonAuctions ?? this.endingSoonAuctions,
      trendingCategories: trendingCategories ?? this.trendingCategories,
      stats: stats ?? this.stats,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  factory HomeData.initial() {
    return HomeData(
      featuredAuctions: [],
      endingSoonAuctions: [],
      trendingCategories: [],
      stats: {},
      isLoading: true,
    );
  }
}

// Home Data Provider
final homeDataProvider = StateNotifierProvider<HomeDataNotifier, HomeData>((
  ref,
) {
  final homeService = ref.read(homeServiceProvider);
  return HomeDataNotifier(homeService, ref);
});

class HomeDataNotifier extends StateNotifier<HomeData> {
  final HomeService _homeService;
  final Ref _ref;

  HomeDataNotifier(this._homeService, this._ref) : super(HomeData.initial()) {
    // Watch auth state and reload data when user logs in
    _ref.listen(authProvider, (previous, next) {
      if (next.hasValue && next.value != null && previous?.value == null) {
        // User just logged in, reload home data
        loadHomeData();
      }
    });
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Load all data in parallel for better performance
      final results = await Future.wait([
        _homeService.getFeaturedAuctions(),
        _homeService.getEndingSoonAuctions(),
        _homeService.getTrendingCategories(),
        _homeService.getHomeStats(),
      ]);

      state = HomeData(
        featuredAuctions: results[0] as List<Auction>,
        endingSoonAuctions: results[1] as List<Auction>,
        trendingCategories: results[2] as List<Category>,
        stats: results[3] as Map<String, dynamic>,
        isLoading: false,
      );
    } catch (e) {
      String errorMessage = e.toString();

      // Handle specific error types
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          errorMessage = 'Your session has expired. Please log in again.';
        } else if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          errorMessage =
              'Connection timeout. Please check your internet connection.';
        } else if (e.type == DioExceptionType.connectionError) {
          errorMessage = 'No internet connection. Please check your network.';
        } else {
          errorMessage = 'Failed to load data. Please try again.';
        }
      }

      state = state.copyWith(isLoading: false, error: errorMessage);
    }
  }

  Future<void> refreshData() async {
    await loadHomeData();
  }
}

// Search Provider
final homeSearchProvider =
    StateNotifierProvider<HomeSearchNotifier, AsyncValue<List<Auction>>>((ref) {
      final homeService = ref.read(homeServiceProvider);
      return HomeSearchNotifier(homeService);
    });

class HomeSearchNotifier extends StateNotifier<AsyncValue<List<Auction>>> {
  final HomeService _homeService;

  HomeSearchNotifier(this._homeService) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading();

    try {
      final results = await _homeService.searchAuctions(query);
      state = AsyncValue.data(results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void clearSearch() {
    state = const AsyncValue.data([]);
  }
}
