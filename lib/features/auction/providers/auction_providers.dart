import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../data/auction_service.dart';
import '../domain/auction.dart';

final auctionServiceProvider = Provider<AuctionService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuctionService(apiClient);
});

final allAuctionsProvider = StateNotifierProvider<AllAuctionsNotifier, AsyncValue<AuctionListState>>((ref) {
  final auctionService = ref.read(auctionServiceProvider);
  return AllAuctionsNotifier(auctionService);
});

final categoryAuctionsProvider = StateNotifierProvider.family<CategoryAuctionsNotifier, AsyncValue<AuctionListState>, String>((ref, categoryId) {
  final auctionService = ref.read(auctionServiceProvider);
  return CategoryAuctionsNotifier(auctionService, categoryId);
});

final myAuctionsProvider = StateNotifierProvider<MyAuctionsNotifier, AsyncValue<AuctionListState>>((ref) {
  final auctionService = ref.read(auctionServiceProvider);
  return MyAuctionsNotifier(auctionService);
});

final auctionSearchProvider = StateNotifierProvider<AuctionSearchNotifier, AsyncValue<AuctionListState>>((ref) {
  final auctionService = ref.read(auctionServiceProvider);
  return AuctionSearchNotifier(auctionService);
});

final auctionDetailsProvider = StateNotifierProvider.family<AuctionDetailsNotifier, AsyncValue<Auction>, String>((ref, auctionId) {
  final auctionService = ref.read(auctionServiceProvider);
  return AuctionDetailsNotifier(auctionService, auctionId);
});

final auctionFiltersProvider = StateNotifierProvider<AuctionFiltersNotifier, AuctionFilters>((ref) {
  return AuctionFiltersNotifier();
});

class AuctionListState {
  final List<Auction> auctions;
  final int currentPage;
  final int totalPages;
  final int totalCount;
  final bool hasNextPage;

  AuctionListState({
    required this.auctions,
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
    required this.hasNextPage,
  });

  factory AuctionListState.empty() {
    return AuctionListState(
      auctions: [],
      currentPage: 1,
      totalPages: 1,
      totalCount: 0,
      hasNextPage: false,
    );
  }

  factory AuctionListState.fromResponse(Map<String, dynamic> response) {
    final data = response['data'] as Map<String, dynamic>;
    final auctionsList = data['auctions'] as List;

    return AuctionListState(
      auctions: auctionsList.map((json) => Auction.fromJson(json as Map<String, dynamic>)).toList(),
      currentPage: data['page'] ?? 1,
      totalPages: ((data['total'] ?? 0) / (data['limit'] ?? 20)).ceil(),
      totalCount: data['total'] ?? 0,
      hasNextPage: ((data['page'] ?? 1) * (data['limit'] ?? 20)) < (data['total'] ?? 0),
    );
  }

  AuctionListState copyWith({
    List<Auction>? auctions,
    int? currentPage,
    int? totalPages,
    int? totalCount,
    bool? hasNextPage,
  }) {
    return AuctionListState(
      auctions: auctions ?? this.auctions,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalCount: totalCount ?? this.totalCount,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class AllAuctionsNotifier extends StateNotifier<AsyncValue<AuctionListState>> {
  final AuctionService _auctionService;

  AllAuctionsNotifier(this._auctionService) : super(const AsyncValue.loading()) {
    loadAuctions();
  }

  Future<void> loadAuctions({
    int page = 1,
    String? status,
    String? categoryId,
    String? sellerId,
  }) async {
    if (page == 1) {
      state = const AsyncValue.loading();
    }

    try {
      final response = await _auctionService.getAllAuctions(
        page: page,
        status: status,
        categoryId: categoryId,
        sellerId: sellerId,
      );

      print('🎯 AUCTIONS: API Response - Total: ${response['data']['total']}, Auctions count: ${response['data']['auctions']?.length ?? 0}');
      final newState = AuctionListState.fromResponse(response);

      if (page == 1) {
        state = AsyncValue.data(newState);
      } else {
        // Append for pagination
        state = state.when(
          data: (currentState) => AsyncValue.data(
            currentState.copyWith(
              auctions: [...currentState.auctions, ...newState.auctions],
              currentPage: newState.currentPage,
              hasNextPage: newState.hasNextPage,
            ),
          ),
          loading: () => AsyncValue.data(newState),
          error: (error, stack) => AsyncValue.data(newState),
        );
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> refresh() async {
    await loadAuctions(page: 1);
  }

  Future<void> loadMore() async {
    final currentState = state.valueOrNull;
    if (currentState != null && currentState.hasNextPage) {
      await loadAuctions(page: currentState.currentPage + 1);
    }
  }
}

class CategoryAuctionsNotifier extends StateNotifier<AsyncValue<AuctionListState>> {
  final AuctionService _auctionService;
  final String _categoryId;

  CategoryAuctionsNotifier(this._auctionService, this._categoryId) : super(const AsyncValue.loading()) {
    loadCategoryAuctions();
  }

  Future<void> loadCategoryAuctions({int page = 1}) async {
    if (page == 1) {
      state = const AsyncValue.loading();
    }

    try {
      final response = await _auctionService.getAllAuctions(
        page: page,
        categoryId: _categoryId,
      );

      final newState = AuctionListState.fromResponse(response);

      if (page == 1) {
        state = AsyncValue.data(newState);
      } else {
        state = state.when(
          data: (currentState) => AsyncValue.data(
            currentState.copyWith(
              auctions: [...currentState.auctions, ...newState.auctions],
              currentPage: newState.currentPage,
              hasNextPage: newState.hasNextPage,
            ),
          ),
          loading: () => AsyncValue.data(newState),
          error: (error, stack) => AsyncValue.data(newState),
        );
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> refresh() async {
    await loadCategoryAuctions(page: 1);
  }

  Future<void> loadMore() async {
    final currentState = state.valueOrNull;
    if (currentState != null && currentState.hasNextPage) {
      await loadCategoryAuctions(page: currentState.currentPage + 1);
    }
  }
}

class MyAuctionsNotifier extends StateNotifier<AsyncValue<AuctionListState>> {
  final AuctionService _auctionService;

  MyAuctionsNotifier(this._auctionService) : super(const AsyncValue.loading()) {
    loadMyAuctions();
  }

  Future<void> loadMyAuctions({int page = 1}) async {
    if (page == 1) {
      state = const AsyncValue.loading();
    }

    try {
      final response = await _auctionService.getMyAuctions(page: page);
      final newState = AuctionListState.fromResponse(response);

      if (page == 1) {
        state = AsyncValue.data(newState);
      } else {
        state = state.when(
          data: (currentState) => AsyncValue.data(
            currentState.copyWith(
              auctions: [...currentState.auctions, ...newState.auctions],
              currentPage: newState.currentPage,
              hasNextPage: newState.hasNextPage,
            ),
          ),
          loading: () => AsyncValue.data(newState),
          error: (error, stack) => AsyncValue.data(newState),
        );
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> updateAuction(String auctionId, Map<String, dynamic> updates) async {
    try {
      final updatedAuction = await _auctionService.updateAuction(auctionId, updates);
      
      state = state.when(
        data: (currentState) {
          final updatedAuctions = currentState.auctions.map((auction) {
            return auction.id == auctionId ? updatedAuction : auction;
          }).toList();
          
          return AsyncValue.data(currentState.copyWith(auctions: updatedAuctions));
        },
        loading: () => state,
        error: (error, stack) => state,
      );
    } catch (e, stack) {
      // Handle error without affecting the list state
      print('Error updating auction: $e');
    }
  }

  Future<void> deleteAuction(String auctionId) async {
    try {
      await _auctionService.deleteAuction(auctionId);
      
      state = state.when(
        data: (currentState) {
          final filteredAuctions = currentState.auctions
              .where((auction) => auction.id != auctionId)
              .toList();
          
          return AsyncValue.data(currentState.copyWith(
            auctions: filteredAuctions,
            totalCount: currentState.totalCount - 1,
          ));
        },
        loading: () => state,
        error: (error, stack) => state,
      );
    } catch (e, stack) {
      print('Error deleting auction: $e');
      rethrow;
    }
  }

  Future<void> refresh() async {
    await loadMyAuctions(page: 1);
  }
}

class AuctionSearchNotifier extends StateNotifier<AsyncValue<AuctionListState>> {
  final AuctionService _auctionService;

  AuctionSearchNotifier(this._auctionService) : super(AsyncValue.data(AuctionListState.empty()));

  Future<void> searchAuctions(String query, {int page = 1}) async {
    if (query.trim().isEmpty) {
      state = AsyncValue.data(AuctionListState.empty());
      return;
    }

    if (page == 1) {
      state = const AsyncValue.loading();
    }

    try {
      final response = await _auctionService.searchAuctions(
        query: query,
        page: page,
      );

      final newState = AuctionListState.fromResponse(response);

      if (page == 1) {
        state = AsyncValue.data(newState);
      } else {
        state = state.when(
          data: (currentState) => AsyncValue.data(
            currentState.copyWith(
              auctions: [...currentState.auctions, ...newState.auctions],
              currentPage: newState.currentPage,
              hasNextPage: newState.hasNextPage,
            ),
          ),
          loading: () => AsyncValue.data(newState),
          error: (error, stack) => AsyncValue.data(newState),
        );
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void clearSearch() {
    state = AsyncValue.data(AuctionListState.empty());
  }
}

class AuctionDetailsNotifier extends StateNotifier<AsyncValue<Auction>> {
  final AuctionService _auctionService;
  final String auctionId;

  AuctionDetailsNotifier(this._auctionService, this.auctionId) : super(const AsyncValue.loading()) {
    loadAuction();
  }

  Future<void> loadAuction() async {
    state = const AsyncValue.loading();
    try {
      final auction = await _auctionService.getAuctionById(auctionId);
      state = AsyncValue.data(auction);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> refresh() async {
    await loadAuction();
  }
}

class AuctionFilters {
  final String? status;
  final String? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final String? sortBy;
  final bool sortDescending;

  AuctionFilters({
    this.status,
    this.categoryId,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
    this.sortDescending = true,
  });

  AuctionFilters copyWith({
    String? status,
    String? categoryId,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
    bool? sortDescending,
  }) {
    return AuctionFilters(
      status: status ?? this.status,
      categoryId: categoryId ?? this.categoryId,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sortBy: sortBy ?? this.sortBy,
      sortDescending: sortDescending ?? this.sortDescending,
    );
  }

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{};
    if (status != null) params['status'] = status;
    if (categoryId != null) params['category_id'] = categoryId;
    if (minPrice != null) params['min_price'] = minPrice;
    if (maxPrice != null) params['max_price'] = maxPrice;
    if (sortBy != null) params['sort_by'] = sortBy;
    params['sort_desc'] = sortDescending;
    return params;
  }
}

class AuctionFiltersNotifier extends StateNotifier<AuctionFilters> {
  AuctionFiltersNotifier() : super(AuctionFilters());

  void updateStatus(String? status) {
    state = state.copyWith(status: status);
  }

  void updateCategory(String? categoryId) {
    state = state.copyWith(categoryId: categoryId);
  }

  void updatePriceRange(double? minPrice, double? maxPrice) {
    state = state.copyWith(minPrice: minPrice, maxPrice: maxPrice);
  }

  void updateSorting(String? sortBy, bool descending) {
    state = state.copyWith(sortBy: sortBy, sortDescending: descending);
  }

  void clearFilters() {
    state = AuctionFilters();
  }
}