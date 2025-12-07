import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/app_bar_custom.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/error_widget.dart';
import '../providers/auction_providers.dart';
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
  @override
  void initState() {
    super.initState();
    // Auto-refresh every 30 seconds for live data
    _startAutoRefresh();
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
    return Scaffold(
      appBar: AppBarCustom(
        title: auction.productName,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareAuction(auction),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => _toggleWatchlist(auction),
          ),
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
              child: BiddingWidget(auction: auction),
            ),

          // Auction Information Tabs
          SliverFillRemaining(
            child: AuctionInfoTabs(auction: auction),
          ),
        ],
      ),
      bottomNavigationBar: auction.isActive 
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

  void _toggleWatchlist(Auction auction) {
    // Implement watchlist functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to watchlist!')),
    );
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