import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'auction_provider.dart';
import '../domain/auction.dart';
import '../../../core/theme/app_theme.dart';

class AuctionListScreen extends ConsumerStatefulWidget {
  final String? categoryId;
  final String? search;

  const AuctionListScreen({
    super.key,
    this.categoryId,
    this.search,
  });

  @override
  ConsumerState<AuctionListScreen> createState() => _AuctionListScreenState();
}

class _AuctionListScreenState extends ConsumerState<AuctionListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String? _currentSearch;
  
  @override
  void initState() {
    super.initState();
    _searchController.text = widget.search ?? '';
    _currentSearch = widget.search;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    setState(() {
      _currentSearch = _searchController.text.isEmpty ? null : _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auctionsAsync = ref.watch(
      auctionListProvider(
        categoryId: widget.categoryId,
        search: _currentSearch,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auctions'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDrawer(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            color: AppTheme.surfaceColor,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search auctions...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, size: 20),
                              onPressed: () {
                                _searchController.clear();
                                _performSearch();
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: AppTheme.backgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onSubmitted: (_) => _performSearch(),
                    onChanged: (_) => setState(() {}),
                    textInputAction: TextInputAction.search,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingSm),
                Container(
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: _performSearch,
                  ),
                ),
              ],
            ),
          ),
          // Auction List
          Expanded(
            child: auctionsAsync.when(
              data: (auctions) => _buildAuctionList(auctions),
              loading: () => _buildLoadingState(),
              error: (err, stack) => _buildErrorState(context, err),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuctionList(List<Auction> auctions) {
    if (auctions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.gavel_outlined,
              size: 64,
              color: AppTheme.textMuted,
            ),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              'No auctions found',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.textMuted,
                  ),
            ),
            const SizedBox(height: AppTheme.spacingSm),
            Text(
              'Try adjusting your search or filters',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      itemCount: auctions.length,
      itemBuilder: (context, index) {
        return _AuctionCard(auction: auctions[index]);
      },
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 120,
          margin: const EdgeInsets.only(bottom: AppTheme.spacingMd),
          decoration: BoxDecoration(
            color: AppTheme.borderColor,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppTheme.errorColor.withValues(alpha: 0.5),
          ),
          const SizedBox(height: AppTheme.spacingMd),
          Text(
            'Oops! Something went wrong',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingXl),
            child: Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppTheme.spacingLg),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  void _showFilterDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppTheme.radiusLg)),
      ),
      builder: (context) => const _FilterDrawer(),
    );
  }
}

class _AuctionCard extends StatelessWidget {
  final Auction auction;

  const _AuctionCard({required this.auction});

  @override
  Widget build(BuildContext context) {
    final timeRemaining = auction.endTime.difference(DateTime.now());
    final isEndingSoon = timeRemaining.inHours < 24;
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppTheme.borderColor),
        boxShadow: AppTheme.shadowSm,
      ),
      child: InkWell(
        onTap: () {
          context.go('/auctions/${auction.id}');
        },
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppTheme.radiusMd),
                  ),
                  child: auction.images.isNotEmpty
                      ? Image.network(
                          auction.images.first,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return _buildImagePlaceholder();
                          },
                        )
                      : _buildImagePlaceholder(),
                ),
                // Status Badge
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(),
                      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                      boxShadow: AppTheme.shadowSm,
                    ),
                    child: Text(
                      auction.status.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                // Watchlist Button
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: AppTheme.shadowSm,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: AppTheme.accentColor,
                      iconSize: 20,
                      onPressed: () {
                        // TODO: Add to watchlist
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    auction.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppTheme.spacingSm),
                  // Price Row
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 18,
                        color: AppTheme.successColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Current Bid:',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '\$${auction.currentBid?.toStringAsFixed(2) ?? auction.startPrice?.toStringAsFixed(2) ?? '0.00'}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppTheme.successColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacingSm),
                  // Stats Row
                  Row(
                    children: [
                      _buildStat(
                        context,
                        Icons.gavel,
                        '${auction.bidCount} Bids',
                      ),
                      const SizedBox(width: AppTheme.spacingMd),
                      _buildStat(
                        context,
                        Icons.visibility_outlined,
                        '${auction.watchersCount} Watching',
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isEndingSoon
                              ? AppTheme.errorColor.withValues(alpha: 0.1)
                              : AppTheme.infoColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: isEndingSoon
                                  ? AppTheme.errorColor
                                  : AppTheme.infoColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatTimeRemaining(timeRemaining),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isEndingSoon
                                    ? AppTheme.errorColor
                                    : AppTheme.infoColor,
                              ),
                            ),
                          ],
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

  Widget _buildImagePlaceholder() {
    return Container(
      height: 180,
      width: double.infinity,
      color: AppTheme.borderColor,
      child: const Icon(
        Icons.image,
        size: 48,
        color: AppTheme.textMuted,
      ),
    );
  }

  Widget _buildStat(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppTheme.textMuted),
        const SizedBox(width: 4),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (auction.status.toLowerCase()) {
      case 'active':
        return AppTheme.successColor;
      case 'ending_soon':
        return AppTheme.warningColor;
      case 'ended':
        return AppTheme.textMuted;
      default:
        return AppTheme.infoColor;
    }
  }

  String _formatTimeRemaining(Duration duration) {
    if (duration.isNegative) return 'Ended';
    
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else {
      return '${duration.inMinutes}m';
    }
  }
}

class _FilterDrawer extends StatefulWidget {
  const _FilterDrawer();

  @override
  State<_FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<_FilterDrawer> {
  RangeValues _priceRange = const RangeValues(0, 10000);
  String _selectedStatus = 'all';
  String _sortBy = 'ending_soonest';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.borderColor,
                  borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.all(AppTheme.spacingLg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _priceRange = const RangeValues(0, 10000);
                          _selectedStatus = 'all';
                          _sortBy = 'ending_soonest';
                        });
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ),
              const Divider(),
              // Filter Options
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(AppTheme.spacingLg),
                  children: [
                    // Price Range
                    Text(
                      'Price Range',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    RangeSlider(
                      values: _priceRange,
                      min: 0,
                      max: 10000,
                      divisions: 100,
                      labels: RangeLabels(
                        '\$${_priceRange.start.round()}',
                        '\$${_priceRange.end.round()}',
                      ),
                      onChanged: (values) {
                        setState(() {
                          _priceRange = values;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${_priceRange.start.round()}'),
                        Text('\$${_priceRange.end.round()}'),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spacingLg),
                    // Status
                    Text(
                      'Status',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    Wrap(
                      spacing: AppTheme.spacingSm,
                      runSpacing: AppTheme.spacingSm,
                      children: [
                        _buildFilterChip('All', 'all'),
                        _buildFilterChip('Active', 'active'),
                        _buildFilterChip('Ending Soon', 'ending_soon'),
                        _buildFilterChip('Ended', 'ended'),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spacingLg),
                    // Sort By
                    Text(
                      'Sort By',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    Column(
                      children: ['ending_soonest', 'newest', 'highest_bid', 'most_watched'].map(
                        (sort) => RadioListTile<String>(
                          value: sort,
                          groupValue: _sortBy,
                          title: Text(_getSortLabel(sort)),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _sortBy = value;
                              });
                            }
                          },
                        ),
                      ).toList(),
                    ),
                  ],
                ),
              ),
              // Apply Button
              Padding(
                padding: const EdgeInsets.all(AppTheme.spacingLg),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Apply filters
                      Navigator.pop(context);
                    },
                    child: const Text('Apply Filters'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _selectedStatus == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedStatus = value;
        });
      },
      backgroundColor: AppTheme.surfaceColor,
      selectedColor: AppTheme.primaryColor.withValues(alpha: 0.2),
      checkmarkColor: AppTheme.primaryColor,
      side: BorderSide(
        color: isSelected ? AppTheme.primaryColor : AppTheme.borderColor,
      ),
    );
  }

  String _getSortLabel(String sort) {
    switch (sort) {
      case 'ending_soonest':
        return 'Ending Soonest';
      case 'newest':
        return 'Newest';
      case 'highest_bid':
        return 'Highest Bid';
      case 'most_watched':
        return 'Most Watched';
      default:
        return sort;
    }
  }
}
