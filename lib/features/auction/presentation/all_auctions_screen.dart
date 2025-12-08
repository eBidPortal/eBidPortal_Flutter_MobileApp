import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/app_bar_custom.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/error_widget.dart';
import '../providers/auction_providers.dart';
import '../widgets/auction_card.dart';
import '../widgets/auction_filters_sheet.dart';
import '../widgets/auction_search_bar.dart';
import 'auction_details_screen.dart';

class AllAuctionsScreen extends ConsumerStatefulWidget {
  final String? categoryId;

  const AllAuctionsScreen({super.key, this.categoryId});

  @override
  ConsumerState<AllAuctionsScreen> createState() => _AllAuctionsScreenState();
}

class _AllAuctionsScreenState extends ConsumerState<AllAuctionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_onScroll);
    
    // Load auctions with category filter if provided
    if (widget.categoryId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(allAuctionsProvider.notifier).loadAuctions(categoryId: widget.categoryId);
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Load more auctions when reaching bottom
      if (_tabController.index == 0) {
        if (widget.categoryId != null) {
          ref.read(categoryAuctionsProvider(widget.categoryId!).notifier).loadMore();
        } else {
          ref.read(allAuctionsProvider.notifier).loadMore();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: widget.categoryId != null ? 'Category Auctions' : 'Live Auctions',
        actions: [
          if (widget.categoryId != null)
            IconButton(
              icon: const Icon(Icons.clear),
              tooltip: 'Clear category filter',
              onPressed: _clearCategoryFilter,
            ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilters,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshCurrentTab,
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Header (when category is selected)
          if (widget.categoryId != null) _buildCategoryHeader(),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AuctionSearchBar(
              onSearchChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
                if (query.isNotEmpty) {
                  ref.read(auctionSearchProvider.notifier).searchAuctions(query);
                }
              },
            ),
          ),

          // Tab Bar
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'All Auctions'),
              Tab(text: 'Live Now'),
              Tab(text: 'Ending Soon'),
            ],
          ),

          // Tab Content
          Expanded(
            child: _searchQuery.isNotEmpty 
                ? _buildSearchResults()
                : TabBarView(
                    controller: _tabController,
                    children: [
                      _buildAllAuctions(),
                      _buildLiveAuctions(),
                      _buildEndingSoonAuctions(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return Consumer(
      builder: (context, ref, child) {
        final searchState = ref.watch(auctionSearchProvider);
        
        return searchState.when(
          data: (auctionListState) {
            if (auctionListState.auctions.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No auctions found',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: auctionListState.auctions.length,
              itemBuilder: (context, index) {
                final auction = auctionListState.auctions[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AuctionCard(
                    auction: auction,
                    onTap: () => _navigateToDetails(auction.id),
                  ),
                );
              },
            );
          },
          loading: () => LoadingWidget(),
          error: (error, stack) => AppErrorWidget(
            message: error.toString(),
            onRetry: () => ref.read(auctionSearchProvider.notifier).searchAuctions(_searchQuery),
          ),
        );
      },
    );
  }

  Widget _buildAllAuctions() {
    return Consumer(
      builder: (context, ref, child) {
        final auctionsState = widget.categoryId != null
            ? ref.watch(categoryAuctionsProvider(widget.categoryId!))
            : ref.watch(allAuctionsProvider);
        
        return auctionsState.when(
          data: (auctionListState) {
            if (auctionListState.auctions.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.gavel, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No auctions available',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () => ref.read(allAuctionsProvider.notifier).refresh(),
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: auctionListState.auctions.length + 
                    (auctionListState.hasNextPage ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= auctionListState.auctions.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final auction = auctionListState.auctions[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: AuctionCard(
                      auction: auction,
                      onTap: () => _navigateToDetails(auction.id),
                    ),
                  );
                },
              ),
            );
          },
          loading: () => LoadingWidget(),
          error: (error, stack) => AppErrorWidget(
            message: error.toString(),
            onRetry: () => ref.read(allAuctionsProvider.notifier).refresh(),
          ),
        );
      },
    );
  }

  Widget _buildLiveAuctions() {
    return Consumer(
      builder: (context, ref, child) {
        final auctionsState = ref.watch(allAuctionsProvider);
        
        return auctionsState.when(
          data: (auctionListState) {
            final liveAuctions = auctionListState.auctions
                .where((auction) => auction.isLive)
                .toList();

            if (liveAuctions.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.live_tv, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No live auctions',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: liveAuctions.length,
              itemBuilder: (context, index) {
                final auction = liveAuctions[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AuctionCard(
                    auction: auction,
                    onTap: () => _navigateToDetails(auction.id),
                    showLiveBadge: true,
                  ),
                );
              },
            );
          },
          loading: () => LoadingWidget(),
          error: (error, stack) => AppErrorWidget(
            message: error.toString(),
            onRetry: () => ref.read(allAuctionsProvider.notifier).refresh(),
          ),
        );
      },
    );
  }

  Widget _buildEndingSoonAuctions() {
    return Consumer(
      builder: (context, ref, child) {
        final auctionsState = ref.watch(allAuctionsProvider);
        
        return auctionsState.when(
          data: (auctionListState) {
            final endingSoonAuctions = auctionListState.auctions
                .where((auction) => auction.isActive && 
                    auction.timeRemaining.inHours <= 24)
                .toList();

            if (endingSoonAuctions.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timer, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No auctions ending soon',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: endingSoonAuctions.length,
              itemBuilder: (context, index) {
                final auction = endingSoonAuctions[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AuctionCard(
                    auction: auction,
                    onTap: () => _navigateToDetails(auction.id),
                    showEndingSoon: true,
                  ),
                );
              },
            );
          },
          loading: () => LoadingWidget(),
          error: (error, stack) => AppErrorWidget(
            message: error.toString(),
            onRetry: () => ref.read(allAuctionsProvider.notifier).refresh(),
          ),
        );
      },
    );
  }

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AuctionFiltersSheet(),
    ).then((_) {
      // Refresh auctions when filters are applied
      if (widget.categoryId != null) {
        ref.read(categoryAuctionsProvider(widget.categoryId!).notifier).refresh();
      } else {
        ref.read(allAuctionsProvider.notifier).refresh();
      }
    });
  }

  void _refreshCurrentTab() {
    if (_searchQuery.isNotEmpty) {
      ref.read(auctionSearchProvider.notifier).searchAuctions(_searchQuery);
    } else {
      if (widget.categoryId != null) {
        ref.read(categoryAuctionsProvider(widget.categoryId!).notifier).refresh();
      } else {
        ref.read(allAuctionsProvider.notifier).refresh();
      }
    }
  }

  Widget _buildCategoryHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          Icon(
            Icons.category,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Showing auctions in selected category',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: _clearCategoryFilter,
            icon: const Icon(Icons.clear, size: 16),
            label: const Text('Clear'),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
              textStyle: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _clearCategoryFilter() {
    GoRouter.of(context).go('/auctions');
  }

  void _navigateToDetails(String auctionId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AuctionDetailsScreen(auctionId: auctionId),
      ),
    );
  }
}