import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/app_bar_custom.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/error_widget.dart';
import '../providers/auction_providers.dart';
import '../domain/auction.dart';
import '../widgets/auction_card.dart';
import '../widgets/auction_filters_sheet.dart';
import '../widgets/auction_search_bar.dart';
import 'auction_details_screen.dart';

class AllAuctionsScreen extends ConsumerStatefulWidget {
  const AllAuctionsScreen({super.key});

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
        ref.read(allAuctionsProvider.notifier).loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: 'Live Auctions',
        actions: [
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
        final auctionsState = ref.watch(allAuctionsProvider);
        
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
      ref.read(allAuctionsProvider.notifier).refresh();
    });
  }

  void _refreshCurrentTab() {
    if (_searchQuery.isNotEmpty) {
      ref.read(auctionSearchProvider.notifier).searchAuctions(_searchQuery);
    } else {
      ref.read(allAuctionsProvider.notifier).refresh();
    }
  }

  void _navigateToDetails(String auctionId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AuctionDetailsScreen(auctionId: auctionId),
      ),
    );
  }
}