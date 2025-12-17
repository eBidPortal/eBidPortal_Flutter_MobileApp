import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/auction.dart';
import '../presentation/auction_provider.dart';

class AuctionCard extends ConsumerStatefulWidget {
  final Auction auction;
  final VoidCallback onTap;
  final bool showLiveBadge;
  final bool showEndingSoon;
  final bool showManagementActions;
  final bool showWatchlistButton;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onClone;

  const AuctionCard({
    super.key,
    required this.auction,
    required this.onTap,
    this.showLiveBadge = false,
    this.showEndingSoon = false,
    this.showManagementActions = false,
    this.showWatchlistButton = false,
    this.onEdit,
    this.onDelete,
    this.onClone,
  });

  @override
  ConsumerState<AuctionCard> createState() => _AuctionCardState();
}

class _AuctionCardState extends ConsumerState<AuctionCard> {
  bool _isTogglingWatchlist = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and badges
            Stack(
              children: [
                _buildImage(context),
                _buildBadges(context),
                if (widget.showManagementActions) _buildManagementMenu(context),
              ],
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.auction.productName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${widget.auction.currentPrice.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (widget.auction.hasReservePrice)
                            Text(
                              'Reserve: \$${widget.auction.reservePrice!.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Brand and Condition
                  if (widget.auction.brand != null || widget.auction.condition != null)
                    Row(
                      children: [
                        if (widget.auction.brand != null) ...[
                          Icon(Icons.business, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            widget.auction.brand!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          if (widget.auction.condition != null) ...[
                            const Text(' • ', style: TextStyle(color: Colors.grey)),
                          ],
                        ],
                        if (widget.auction.condition != null) ...[
                          Icon(Icons.info_outline, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            widget.auction.condition!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),

                  const SizedBox(height: 12),

                  // Time and Status Info
                  Row(
                    children: [
                      Expanded(
                        child: _buildTimeInfo(context),
                      ),
                      const SizedBox(width: 8),
                      _buildStatusChip(context),
                    ],
                  ),

                  // Bid count and watchers
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.gavel, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.auction.bidCount} bids',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.visibility, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.auction.watchersCount} watching',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        color: Colors.grey[200],
      ),
      child: widget.auction.images.isNotEmpty
          ? ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                widget.auction.images.first,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
              ),
            )
          : _buildImagePlaceholder(),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image, size: 48, color: Colors.grey),
            SizedBox(height: 8),
            Text('No Image', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildBadges(BuildContext context) {
    return Stack(
      children: [
        // Left side badges
        Positioned(
          top: 12,
          left: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.showLiveBadge && widget.auction.isLive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              if (widget.showEndingSoon && widget.auction.timeRemaining.inHours <= 1) ...[
                if (widget.showLiveBadge && widget.auction.isLive) const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'ENDING SOON',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              if (widget.auction.hasReservePrice && !widget.auction.reservePriceMet) ...[
                if ((widget.showLiveBadge && widget.auction.isLive) || (widget.showEndingSoon && widget.auction.timeRemaining.inHours <= 1))
                  const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'RESERVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        // Right side watchlist button
        if (widget.showWatchlistButton)
          Positioned(
            top: 12,
            right: 12,
            child: _buildWatchlistButton(),
          ),
      ],
    );
  }

  Widget _buildManagementMenu(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: PopupMenuButton<String>(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.more_vert, color: Colors.white, size: 16),
        ),
        onSelected: (value) {
          switch (value) {
            case 'edit':
              widget.onEdit?.call();
              break;
            case 'clone':
              widget.onClone?.call();
              break;
            case 'delete':
              widget.onDelete?.call();
              break;
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'edit',
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
              dense: true,
            ),
          ),
          const PopupMenuItem(
            value: 'clone',
            child: ListTile(
              leading: Icon(Icons.copy),
              title: Text('Clone'),
              dense: true,
            ),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Delete', style: TextStyle(color: Colors.red)),
              dense: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo(BuildContext context) {
    if (widget.auction.isPending) {
      return Row(
        children: [
          Icon(Icons.schedule, size: 14, color: Colors.orange[700]),
          const SizedBox(width: 4),
          Text(
            'Starts ${_formatTimeRemaining(widget.auction.timeToStart)}',
            style: TextStyle(
              color: Colors.orange[700],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    } else if (widget.auction.isActive) {
      return Row(
        children: [
          Icon(Icons.access_time, size: 14, color: Colors.green[700]),
          const SizedBox(width: 4),
          Text(
            'Ends ${_formatTimeRemaining(widget.auction.timeRemaining)}',
            style: TextStyle(
              color: Colors.green[700],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(Icons.done, size: 14, color: Colors.grey[600]),
          const SizedBox(width: 4),
          Text(
            'Auction ended',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildStatusChip(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (widget.auction.status) {
      case AuctionStatus.active:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case AuctionStatus.pending:
        backgroundColor = Colors.orange;
        textColor = Colors.white;
        break;
      case AuctionStatus.ended:
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        break;
      case AuctionStatus.cancelled:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        widget.auction.status.displayName.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _formatTimeRemaining(Duration duration) {
    if (duration.inDays > 0) {
      return 'in ${duration.inDays}d ${duration.inHours % 24}h';
    } else if (duration.inHours > 0) {
      return 'in ${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return 'in ${duration.inMinutes}m';
    } else {
      return 'in ${duration.inSeconds}s';
    }
  }

  Widget _buildWatchlistButton() {
    return Consumer(
      builder: (context, ref, child) {
        final isInWatchlistAsync = ref.watch(isInWatchlistProvider(widget.auction.id));

        return isInWatchlistAsync.when(
          data: (isInWatchlist) => GestureDetector(
            onTap: _isTogglingWatchlist ? null : () => _toggleWatchlist(ref, isInWatchlist),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isInWatchlist ? Icons.favorite : Icons.favorite_border,
                color: isInWatchlist ? Theme.of(context).primaryColor : Colors.white,
                size: 20,
              ),
            ),
          ),
          loading: () => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
          error: (error, stack) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.error,
              color: Colors.red,
              size: 20,
            ),
          ),
        );
      },
    );
  }

  Future<void> _toggleWatchlist(WidgetRef ref, bool currentlyInWatchlist) async {
    setState(() {
      _isTogglingWatchlist = true;
    });

    try {
      await ref.read(watchlistActionsProvider.notifier).toggleWatchlist(widget.auction.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              currentlyInWatchlist
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
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isTogglingWatchlist = false;
        });
      }
    }
  }
}