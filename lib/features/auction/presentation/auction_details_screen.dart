import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/app_bar_custom.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/error_widget.dart';
import '../../../core/services/websocket_service.dart';
import '../../auth/presentation/auth_provider.dart';
import '../providers/auction_providers.dart';
import 'auction_provider.dart';
import '../domain/auction.dart';
import '../widgets/auction_image_carousel.dart';
import '../widgets/auction_timer_widget.dart';
import '../widgets/bidding_widget.dart';
import '../widgets/auction_info_tabs.dart';

class AuctionDetailsScreen extends ConsumerStatefulWidget {
  final String auctionId;

  const AuctionDetailsScreen({
    super.key,
    required this.auctionId,
  });

  @override
  ConsumerState<AuctionDetailsScreen> createState() => _AuctionDetailsScreenState();
}

class _AuctionDetailsScreenState extends ConsumerState<AuctionDetailsScreen> {
  late WebSocketService _webSocketService;

  @override
  void initState() {
    super.initState();
    _setupWebSocket();
    // Auto-refresh every 30 seconds for live data (as fallback)
    _startAutoRefresh();
  }

  @override
  void dispose() {
    _webSocketService.leaveAuction(widget.auctionId);
    _webSocketService.offBidUpdate();
    _webSocketService.offAuctionStatusChange();
    _webSocketService.offAuctionEndingSoon();
    _webSocketService.offAuctionExtended();
    _webSocketService.offAuctionEnded();
    super.dispose();
  }

  void _setupWebSocket() {
    _webSocketService = ref.read(webSocketServiceProvider);
    
    // Get current user
    final authState = ref.read(authProvider);
    
    // Connect to WebSocket if not already connected
    _webSocketService.connect().then((_) {
      // Join the auction room for real-time updates
      authState.whenData((user) {
        if (user != null) {
          _webSocketService.joinAuction(widget.auctionId, user.id);
        }
      });
      
      // Listen for bid updates
      _webSocketService.onBidUpdate((data) {
        if (mounted) {
          _handleBidUpdate(data);
        }
      });
      
      // Listen for auction status changes
      _webSocketService.onAuctionStatusChange((data) {
        if (mounted) {
          _handleAuctionStatusChange(data);
        }
      });
      
      // Listen for auction ending soon
      _webSocketService.onAuctionEndingSoon((data) {
        if (mounted) {
          _handleAuctionEndingSoon(data);
        }
      });
      
      // Listen for auction extended
      _webSocketService.onAuctionExtended((data) {
        if (mounted) {
          _handleAuctionExtended(data);
        }
      });
      
      // Listen for auction ended
      _webSocketService.onAuctionEnded((data) {
        if (mounted) {
          _handleAuctionEnded(data);
        }
      });
    });
  }

  void _handleBidUpdate(dynamic data) {
    // Refresh auction data when a new bid is placed
    ref.invalidate(auctionDetailProvider(widget.auctionId));
    ref.invalidate(auctionBidsProvider(widget.auctionId));
    
    // Show notification for new bid
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('New bid: \$${data['amount']?.toStringAsFixed(2) ?? '0.00'}'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  void _handleAuctionStatusChange(dynamic data) {
    // Refresh auction data when status changes
    ref.invalidate(auctionDetailProvider(widget.auctionId));
    
    final status = data['status'];
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Auction status changed to: $status'),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  void _handleAuctionEndingSoon(dynamic data) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('⚠️ Auction ending soon! Last chance to bid.'),
          duration: Duration(seconds: 10),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _handleAuctionExtended(dynamic data) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('⏰ Auction extended by ${data['extension_minutes'] ?? 5} minutes due to late bids!'),
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  void _handleAuctionEnded(dynamic data) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('🏁 Auction ended! Winner: ${data['winner_name'] ?? 'Unknown'}'),
          duration: const Duration(seconds: 10),
          backgroundColor: Colors.purple,
        ),
      );
    }
  }

  void _startAutoRefresh() {
    Future.delayed(const Duration(seconds: 30), () {
      if (mounted) {
        ref.read(auctionDetailsProvider(widget.auctionId).notifier).refresh();
        _startAutoRefresh();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final auctionState = ref.watch(auctionDetailsProvider(widget.auctionId));

    return Scaffold(
      body: auctionState.when(
        data: (auction) => _buildAuctionDetails(auction),
        loading: () => Scaffold(
          appBar: AppBarCustom(title: 'Auction Details'),
          body: LoadingWidget(),
        ),
        error: (error, stack) => Scaffold(
          appBar: AppBarCustom(title: 'Auction Details'),
          body: AppErrorWidget(
            message: error.toString(),
            onRetry: () => ref.read(auctionDetailsProvider(widget.auctionId).notifier).refresh(),
          ),
        ),
      ),
    );
  }

  Widget _buildAuctionDetails(Auction auction) {
    final authState = ref.watch(authProvider);
    final isOwnAuction = authState.maybeWhen(
      data: (user) => user?.id == auction.sellerId,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBarCustom(
        title: auction.productName,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareAuction(auction),
          ),
          if (!isOwnAuction) ...[
            Consumer(
              builder: (context, ref, child) {
                final isInWatchlistAsync = ref.watch(isInWatchlistProvider(auction.id));
                return IconButton(
                  icon: isInWatchlistAsync.maybeWhen(
                    data: (isInWatchlist) => Icon(
                      isInWatchlist ? Icons.favorite : Icons.favorite_border,
                      color: isInWatchlist ? Colors.red : null,
                    ),
                    orElse: () => const Icon(Icons.favorite_border),
                  ),
                  onPressed: () => _toggleWatchlist(auction),
                );
              },
            ),
          ],
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuAction(value, auction),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'report',
                child: ListTile(
                  leading: Icon(Icons.flag),
                  title: Text('Report'),
                ),
              ),
              const PopupMenuItem(
                value: 'contact_seller',
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Contact Seller'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Auction Images
          SliverToBoxAdapter(
            child: AuctionImageCarousel(images: auction.images),
          ),

          // Auction Header Info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Status
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          auction.productName,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildStatusBadge(auction),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Brand and Condition
                  if (auction.brand != null || auction.condition != null)
                    Row(
                      children: [
                        if (auction.brand != null) ...[
                          Icon(Icons.business, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            auction.brand!,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          if (auction.condition != null) ...[
                            const SizedBox(width: 16),
                          ],
                        ],
                        if (auction.condition != null) ...[
                          Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            auction.condition!,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ],
                    ),

                  const SizedBox(height: 16),

                  // Timer
                  AuctionTimerWidget(auction: auction),
                ],
              ),
            ),
          ),

          // Current Price and Bidding
          if (auction.isActive)
            SliverToBoxAdapter(
              child: isOwnAuction
                  ? _buildOwnAuctionMessage()
                  : BiddingWidget(auction: auction),
            ),

          // Auction Information Tabs
          SliverFillRemaining(
            child: AuctionInfoTabs(auction: auction),
          ),
        ],
      ),
      bottomNavigationBar: auction.isActive && !isOwnAuction
          ? _buildBottomBiddingBar(auction)
          : null,
    );
  }

  Widget _buildStatusBadge(Auction auction) {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (auction.status) {
      case AuctionStatus.active:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        icon = Icons.live_tv;
        break;
      case AuctionStatus.pending:
        backgroundColor = Colors.orange;
        textColor = Colors.white;
        icon = Icons.schedule;
        break;
      case AuctionStatus.ended:
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        icon = Icons.done;
        break;
      case AuctionStatus.cancelled:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        icon = Icons.cancel;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 4),
          Text(
            auction.status.displayName,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnAuctionMessage() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.blue.shade700,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Auction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'This is your own auction. You cannot bid on or add your own auctions to watchlist.',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBiddingBar(Auction auction) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Bid',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '\$${auction.currentPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () => _showBiddingDialog(auction),
              icon: const Icon(Icons.gavel),
              label: const Text('Place Bid'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareAuction(Auction auction) {
    // Implement share functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share functionality coming soon!')),
    );
  }

  void _toggleWatchlist(Auction auction) async {
    final isInWatchlist = await ref.read(isInWatchlistProvider(auction.id).future);
    
    try {
      await ref.read(watchlistActionsProvider.notifier).toggleWatchlist(auction.id);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isInWatchlist
                ? 'Removed from watchlist'
                : 'Added to watchlist',
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update watchlist: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _handleMenuAction(String action, Auction auction) {
    switch (action) {
      case 'report':
        _reportAuction(auction);
        break;
      case 'contact_seller':
        _contactSeller(auction);
        break;
    }
  }

  void _reportAuction(Auction auction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report Auction'),
        content: const Text('Please describe the issue with this auction.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Report submitted successfully')),
              );
            },
            child: const Text('Submit Report'),
          ),
        ],
      ),
    );
  }

  void _contactSeller(Auction auction) {
    // Navigate to messaging or contact form
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contact seller functionality coming soon!')),
    );
  }

  void _showBiddingDialog(Auction auction) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BiddingWidget(
          auction: auction,
          isFullScreen: true,
        ),
      ),
    );
  }
}