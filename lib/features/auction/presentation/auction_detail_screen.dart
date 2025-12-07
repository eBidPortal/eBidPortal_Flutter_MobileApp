import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../domain/auction.dart';
import 'auction_provider.dart';

class AuctionDetailScreen extends ConsumerWidget {
  final String auctionId;

  const AuctionDetailScreen({
    super.key,
    required this.auctionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📄 SCREEN: AuctionDetailScreen - build called (auctionId: $auctionId)');
    final auctionAsync = ref.watch(auctionDetailProvider(auctionId));

    return Scaffold(
      body: auctionAsync.when(
        data: (auction) => _AuctionDetailView(auction: auction),
        loading: () => const _AuctionDetailLoading(),
        error: (error, stack) => _AuctionDetailError(
          error: error.toString(),
          onRetry: () => ref.invalidate(auctionDetailProvider(auctionId)),
        ),
      ),
    );
  }
}

class _AuctionDetailView extends ConsumerWidget {
  final Auction auction;

  const _AuctionDetailView({required this.auction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInWatchlistAsync = ref.watch(isInWatchlistProvider(auction.id));
    final watchlistActions = ref.watch(watchlistActionsProvider.notifier);

    return CustomScrollView(
      slivers: [
        // App Bar with Image
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: auction.images.isNotEmpty
                ? Image.network(
                    auction.images.first,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppTheme.surfaceColor,
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 64,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  )
                : Container(
                    color: AppTheme.surfaceColor,
                    child: const Icon(
                      Icons.inventory_2,
                      size: 64,
                      color: AppTheme.textSecondary,
                    ),
                  ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // TODO: Implement share functionality
              },
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () async {
                try {
                  await watchlistActions.toggleWatchlist(auction.id);
                  if (context.mounted) {
                    final isInWatchlist = isInWatchlistAsync.value ?? false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isInWatchlist
                              ? 'Removed from watchlist'
                              : 'Added to watchlist',
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to update watchlist'),
                      ),
                    );
                  }
                }
              },
              icon: isInWatchlistAsync.when(
                data: (isInWatchlist) => Icon(
                  isInWatchlist ? Icons.favorite : Icons.favorite_border,
                  color: isInWatchlist ? AppTheme.errorColor : null,
                ),
                loading: () => const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                error: (_, __) => const Icon(Icons.favorite_border),
              ),
            ),
          ],
        ),

        // Content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingLg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Status
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        auction.title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildStatusChip(auction.status.displayName),
                  ],
                ),

                const SizedBox(height: AppTheme.spacingMd),

                // Current Bid / Starting Price
                if (auction.currentBid != null) ...[
                  Text(
                    'Current Bid',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Text(
                    '\$${auction.currentBid!.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ] else ...[
                  Text(
                    'Starting Price',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Text(
                    '\$${auction.startPrice?.toStringAsFixed(2) ?? '0.00'}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],

                const SizedBox(height: AppTheme.spacingMd),

                // Bid Count and Watchers
                Row(
                  children: [
                    Icon(
                      Icons.gavel,
                      size: 16,
                      color: AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${auction.bidCount} bids',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingMd),
                    Icon(
                      Icons.visibility,
                      size: 16,
                      color: AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${auction.watchersCount} watching',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spacingLg),

                // Time Remaining
                _buildTimeRemaining(context),

                const SizedBox(height: AppTheme.spacingLg),

                // Description
                if (auction.description != null && auction.description!.isNotEmpty) ...[
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  Text(
                    auction.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppTheme.spacingLg),
                ],

                // Images Gallery (if multiple)
                if (auction.images.length > 1) ...[
                  Text(
                    'Images',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: auction.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          margin: const EdgeInsets.only(right: AppTheme.spacingMd),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                            image: DecorationImage(
                              image: NetworkImage(auction.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingLg),
                ],

                // Bid Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: auction.status == 'active' ? () {
                      // TODO: Implement bid functionality
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                      ),
                    ),
                    child: Text(
                      auction.status == 'active' ? 'Place Bid' : 'Auction ${auction.status}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppTheme.spacingXl),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String label;

    switch (status.toLowerCase()) {
      case 'active':
        color = AppTheme.successColor;
        label = 'Active';
        break;
      case 'ended':
        color = AppTheme.errorColor;
        label = 'Ended';
        break;
      case 'pending':
        color = AppTheme.warningColor;
        label = 'Pending';
        break;
      default:
        color = AppTheme.textSecondary;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusFull),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTimeRemaining(BuildContext context) {
    final now = DateTime.now();
    final endTime = auction.endTime;
    final difference = endTime.difference(now);

    if (difference.isNegative) {
      return Container(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        decoration: BoxDecoration(
          color: AppTheme.errorColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(color: AppTheme.errorColor.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.timer_off,
              color: AppTheme.errorColor,
              size: 20,
            ),
            const SizedBox(width: AppTheme.spacingMd),
            Text(
              'Auction Ended',
              style: TextStyle(
                color: AppTheme.errorColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.timer,
            color: AppTheme.primaryColor,
            size: 20,
          ),
          const SizedBox(width: AppTheme.spacingMd),
          Text(
            'Ends in: ${days}d ${hours}h ${minutes}m',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AuctionDetailLoading extends StatelessWidget {
  const _AuctionDetailLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _AuctionDetailError extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _AuctionDetailError({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppTheme.errorColor,
            ),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              'Failed to load auction',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingSm),
            Text(
              error,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingLg),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}