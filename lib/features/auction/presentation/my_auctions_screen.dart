import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/app_bar_custom.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/error_widget.dart';
import '../providers/auction_providers.dart';
import '../domain/auction.dart';
import '../widgets/auction_card.dart';
import '../widgets/auction_edit_dialog.dart';

class MyAuctionsScreen extends ConsumerStatefulWidget {
  const MyAuctionsScreen({super.key});

  @override
  ConsumerState<MyAuctionsScreen> createState() => _MyAuctionsScreenState();
}

class _MyAuctionsScreenState extends ConsumerState<MyAuctionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  static const double _scrollThreshold = 100.0; // Load more when within 100 pixels of bottom
  DateTime? _lastScrollTime;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Debounce scroll events (minimum 500ms between triggers)
    final now = DateTime.now();
    if (_lastScrollTime != null && now.difference(_lastScrollTime!).inMilliseconds < 500) {
      return;
    }
    _lastScrollTime = now;

    if (_isLoadingMore) return; // Prevent multiple simultaneous requests

    final position = _scrollController.position;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;
    final distanceToBottom = maxScroll - currentScroll;

    // Only trigger if we have content to scroll (maxScroll > 0) and we're close to the bottom
    // Also ensure we're actually scrolling down (not just at the bottom from initial load)
    if (maxScroll > _scrollThreshold && distanceToBottom <= _scrollThreshold) {
      final currentState = ref.read(myAuctionsProvider).valueOrNull;
      if (currentState != null && currentState.hasNextPage && !_isLoadingMore) {
        _isLoadingMore = true;
        final nextPage = currentState.currentPage + 1;

        print('🔄 MY_AUCTIONS: Loading page $nextPage (current: ${currentState.currentPage}, hasNext: ${currentState.hasNextPage})');

        ref.read(myAuctionsProvider.notifier).loadMyAuctions(page: nextPage).then((_) {
          _isLoadingMore = false;
          print('✅ MY_AUCTIONS: Page $nextPage loaded successfully');
        }).catchError((error) {
          _isLoadingMore = false;
          print('❌ MY_AUCTIONS: Failed to load page $nextPage: $error');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: 'My Auctions',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(myAuctionsProvider.notifier).refresh(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Bar
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Active'),
              Tab(text: 'Pending'),
              Tab(text: 'Ended'),
            ],
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAuctionsList(null),
                _buildAuctionsList('active'),
                _buildAuctionsList('pending'),
                _buildAuctionsList('ended'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToCreateAuction(),
        icon: const Icon(Icons.add),
        label: const Text('Create Auction'),
      ),
    );
  }

  Widget _buildAuctionsList(String? statusFilter) {
    return Consumer(
      builder: (context, ref, child) {
        final auctionsState = ref.watch(myAuctionsProvider);
        
        return auctionsState.when(
          data: (auctionListState) {
            List<Auction> filteredAuctions = auctionListState.auctions;
            
            if (statusFilter != null) {
              filteredAuctions = auctionListState.auctions
                  .where((auction) => auction.status.name == statusFilter)
                  .toList();
            }

            if (filteredAuctions.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getEmptyIcon(statusFilter),
                      size: 64,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _getEmptyMessage(statusFilter),
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    if (statusFilter == null) ...[
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _navigateToCreateAuction(),
                        icon: const Icon(Icons.add),
                        label: const Text('Create Your First Auction'),
                      ),
                    ],
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () => ref.read(myAuctionsProvider.notifier).refresh(),
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: filteredAuctions.length + 
                    (auctionListState.hasNextPage ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= filteredAuctions.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final auction = filteredAuctions[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: AuctionCard(
                      auction: auction,
                      onTap: () => _navigateToDetails(auction.id),
                      showManagementActions: true,
                      onEdit: () => _editAuction(auction),
                      onDelete: () => _deleteAuction(auction),
                      onClone: () => _cloneAuction(auction),
                    ),
                  );
                },
              ),
            );
          },
          loading: () => LoadingWidget(),
          error: (error, stack) => AppErrorWidget(
            message: error.toString(),
            onRetry: () => ref.read(myAuctionsProvider.notifier).refresh(),
          ),
        );
      },
    );
  }

  IconData _getEmptyIcon(String? statusFilter) {
    switch (statusFilter) {
      case 'active':
        return Icons.live_tv;
      case 'pending':
        return Icons.schedule;
      case 'ended':
        return Icons.done_all;
      default:
        return Icons.gavel;
    }
  }

  String _getEmptyMessage(String? statusFilter) {
    switch (statusFilter) {
      case 'active':
        return 'No active auctions';
      case 'pending':
        return 'No pending auctions';
      case 'ended':
        return 'No ended auctions';
      default:
        return 'No auctions found';
    }
  }

  void _editAuction(Auction auction) {
    showDialog(
      context: context,
      builder: (context) => AuctionEditDialog(auction: auction),
    ).then((result) {
      if (result == true) {
        ref.read(myAuctionsProvider.notifier).refresh();
      }
    });
  }

  void _deleteAuction(Auction auction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Auction'),
        content: Text(
          'Are you sure you want to delete "${auction.productName}"?\n\n'
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => _confirmDelete(auction),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(Auction auction) async {
    Navigator.of(context).pop(); // Close dialog

    try {
      await ref.read(myAuctionsProvider.notifier).deleteAuction(auction.id);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Auction "${auction.productName}" deleted successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete auction: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _cloneAuction(Auction auction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clone Auction'),
        content: Text(
          'Create a copy of "${auction.productName}" with new timing?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => _confirmClone(auction),
            child: const Text('Clone'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmClone(Auction auction) async {
    Navigator.of(context).pop(); // Close dialog

    try {
      final now = DateTime.now();
      final modifications = {
        'start_time': now.add(const Duration(hours: 1)).toIso8601String(),
        'end_time': now.add(const Duration(days: 7)).toIso8601String(),
        'status': 'pending',
      };

      final auctionService = ref.read(auctionServiceProvider);
      await auctionService.cloneAuction(auction.id, modifications);
      
      ref.read(myAuctionsProvider.notifier).refresh();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Auction "${auction.productName}" cloned successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to clone auction: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _navigateToDetails(String auctionId) {
    context.go('/auctions/$auctionId');
  }

  void _navigateToCreateAuction() {
    // Navigate to create auction screen
    context.go('/create-auction');
  }
}