import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../domain/watchlist_item.dart';
import 'auction_provider.dart';

class WatchlistScreen extends ConsumerWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('⭐ SCREEN: WatchlistScreen - build called');
    final watchlistAsync = ref.watch(watchlistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: watchlistAsync.when(
        data: (watchlist) => _WatchlistView(watchlist: watchlist),
        loading: () => const _WatchlistLoading(),
        error: (error, stack) => _WatchlistError(
          error: error.toString(),
          onRetry: () => ref.invalidate(watchlistProvider),
        ),
      ),
    );
  }
}

class _WatchlistView extends ConsumerWidget {
  final List<WatchlistItem> watchlist;

  const _WatchlistView({required this.watchlist});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistActions = ref.watch(watchlistActionsProvider.notifier);

    if (watchlist.isEmpty) {
      return const _EmptyWatchlist();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      itemCount: watchlist.length,
      itemBuilder: (context, index) {
        final item = watchlist[index];
        return _WatchlistItemCard(
          item: item,
          onTap: () => context.go('/auctions/${item.auctionId}'),
          onRemove: () async {
            try {
              await watchlistActions.toggleWatchlist(item.auctionId);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Removed from watchlist')),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to remove: $e')),
                );
              }
            }
          },
        );
      },
    );
  }
}

class _WatchlistItemCard extends StatelessWidget {
  final WatchlistItem item;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _WatchlistItemCard({
    required this.item,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingMd),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          child: Row(
            children: [
              // Auction Image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  image: item.images?.isNotEmpty == true
                      ? DecorationImage(
                          image: NetworkImage(item.images!.first),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: item.images?.isNotEmpty != true ? AppTheme.surfaceColor : null,
                ),
                child: item.images?.isNotEmpty != true
                    ? const Icon(
                        Icons.inventory_2,
                        color: AppTheme.textSecondary,
                        size: 32,
                      )
                    : null,
              ),

              const SizedBox(width: AppTheme.spacingMd),

              // Auction Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      item.auctionTitle ?? 'Auction',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Current Bid / Starting Price
                    if (item.currentBid != null) ...[
                      Text(
                        'Current: \$${item.currentBid!.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ] else if (item.startingPrice != null) ...[
                      Text(
                        'Starting: \$${item.startingPrice!.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],

                    const SizedBox(height: 4),

                    // Status and Time
                    Row(
                      children: [
                        _buildStatusChip(item.status ?? 'unknown'),
                        const SizedBox(width: AppTheme.spacingMd),
                        if (item.endTime != null) ...[
                          Icon(
                            Icons.schedule,
                            size: 14,
                            color: AppTheme.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatTimeRemaining(item.endTime!),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Added date
                    Text(
                      'Added ${_formatAddedDate(item.addedAt)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textMuted,
                      ),
                    ),
                  ],
                ),
              ),

              // Remove Button
              IconButton(
                onPressed: onRemove,
                icon: const Icon(
                  Icons.favorite,
                  color: AppTheme.errorColor,
                ),
                tooltip: 'Remove from watchlist',
              ),
            ],
          ),
        ),
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusFull),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _formatTimeRemaining(DateTime endTime) {
    final now = DateTime.now();
    final difference = endTime.difference(now);

    if (difference.isNegative) {
      return 'Ended';
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    if (days > 0) {
      return '${days}d ${hours}h';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      final minutes = difference.inMinutes % 60;
      return '${minutes}m';
    }
  }

  String _formatAddedDate(DateTime addedAt) {
    final now = DateTime.now();
    final difference = now.difference(addedAt);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  }
}

class _EmptyWatchlist extends StatelessWidget {
  const _EmptyWatchlist();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
              color: AppTheme.textSecondary,
            ),
            const SizedBox(height: AppTheme.spacingLg),
            Text(
              'Your watchlist is empty',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              'Add auctions to your watchlist to keep track of items you\'re interested in.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textMuted,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingXl),
            ElevatedButton.icon(
              onPressed: () => context.go('/auctions'),
              icon: const Icon(Icons.search),
              label: const Text('Browse Auctions'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingLg,
                  vertical: AppTheme.spacingMd,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WatchlistLoading extends StatelessWidget {
  const _WatchlistLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _WatchlistError extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _WatchlistError({
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
              'Failed to load watchlist',
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