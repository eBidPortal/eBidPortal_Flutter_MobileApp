import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/providers/location_provider.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/auth/token_manager.dart';
import '../../auction/domain/auction.dart';
import '../../product/domain/product.dart';
import '../../catalog/domain/category.dart';
import '../../auth/presentation/auth_provider.dart';
import '../providers/home_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('🏠 SCREEN: HomeScreen - build called');

    final authState = ref.watch(authProvider);
    final homeData = ref.watch(homeDataProvider);
    final locationState = ref.watch(locationProvider);
    final notifications = ref.watch(notificationsProvider);

    // If user is not authenticated and we got a 401 error, show login prompt
    if (authState.hasValue &&
        authState.value == null &&
        homeData.error != null &&
        homeData.error!.contains('session has expired')) {
      return _LoginPromptView(onLoginTap: () => context.go('/auth/login'));
    }

    return Scaffold(
      body: homeData.isLoading
          ? const _LoadingView()
          : homeData.error != null
          ? _ErrorView(
              error: homeData.error!,
              onRetry: () {
                ref.read(homeDataProvider.notifier).refreshData();
              },
            )
          : CustomScrollView(
              slivers: [
                // Premium App Bar
                SliverAppBar(
                  toolbarHeight: 70,
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  backgroundColor: AppTheme.primaryColor,
                  centerTitle: false,
                  titleSpacing: 20,
                  title: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _showLocationSelector(context, ref),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.location_on, size: 14, color: Colors.white),
                              const SizedBox(width: 4),
                              Text(
                                _getLocationText(locationState),
                                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 14, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      _buildCircleAction(context, Icons.favorite_border, () => context.go('/profile/watchlist')),
                      const SizedBox(width: 10),
                      _buildNotificationIcon(ref, notifications),
                    ],
                  ),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppTheme.spacingMd),
                    child: _buildSearchBar(context, ref),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Stats Row
                      _buildStatsRow(context, homeData.stats),

                      const SizedBox(height: AppTheme.spacingLg),

                      // Quick Actions
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.spacingMd,
                        ),
                        child: _buildQuickActions(context),
                      ),

                      const SizedBox(height: AppTheme.spacingXl),

                      // Featured Auctions Section
                      _buildSectionHeader(
                        context,
                        'Featured Picks',
                        subtitle: 'Curated just for you',
                        onViewAll: () => context.go('/auctions'),
                      ),
                      const SizedBox(height: AppTheme.spacingMd),
                      _buildFeaturedAuctions(
                        context,
                        homeData.featuredAuctions,
                      ),

                      const SizedBox(height: AppTheme.spacingXl),

                      // Nearby Deals Section
                      if (homeData.nearbyProducts.isNotEmpty || homeData.isNearbyLoading) ...[
                        _buildSectionHeader(
                          context,
                          'Near You',
                          subtitle: 'Items available in your area',
                          onViewAll: () => context.go('/auctions'), // TODO: Navigate to nearby search results
                        ),
                        const SizedBox(height: AppTheme.spacingMd),
                        _buildNearbyDeals(
                          context,
                          homeData.nearbyProducts,
                          isLoading: homeData.isNearbyLoading,
                        ),
                        const SizedBox(height: AppTheme.spacingXl),
                      ],

                      // Browse Categories
                      _buildSectionHeader(
                        context,
                        'Browse Categories',
                        subtitle: 'Find what you looking for',
                        onViewAll: () => context.go('/categories'),
                      ),
                      const SizedBox(height: AppTheme.spacingMd),
                      _buildTrendingCategories(
                        context,
                        homeData.trendingCategories,
                      ),

                      const SizedBox(height: AppTheme.spacingXl),

                      // Hot & Ending Soon
                      _buildSectionHeader(
                        context,
                        'Ending Soon',
                        subtitle: 'Last chance to bid!',
                        onViewAll: () =>
                            context.go('/auctions?filter=ending_soon'),
                      ),
                      const SizedBox(height: AppTheme.spacingMd),
                      _buildEndingSoon(context, homeData.endingSoonAuctions),

                      const SizedBox(height: AppTheme.spacingXl),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  String _getLocationText(LocationState locationState) {
    if (locationState.isLoading) {
      return 'Getting location...';
    }
    if (!locationState.hasPermission && !locationState.permissionRequested) {
      return 'Enable Location';
    }
    return locationState.locationName ?? 'Select Location';
  }

  void _showLocationSelector(BuildContext context, WidgetRef ref) {
    final locationNotifier = ref.read(locationProvider.notifier);
    final locationState = ref.read(locationProvider);
    final states = locationNotifier.getStatesList();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, color: AppTheme.primaryColor),
                  const SizedBox(width: AppTheme.spacingSm),
                  Text(
                    'Location Options',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingMd),

              // Current Location Button
              if (!locationState.hasPermission)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: AppTheme.spacingMd),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await locationNotifier.requestLocationPermission();
                    },
                    icon: const Icon(Icons.my_location),
                    label: const Text('Use Current Location'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: AppTheme.spacingMd),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await locationNotifier.refreshLocation();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Refresh Current Location'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),

              const Divider(),
              const SizedBox(height: AppTheme.spacingSm),

              Text(
                'Or select a state manually:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppTheme.spacingMd),

              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: states.length,
                  itemBuilder: (context, index) {
                    final state = states[index];
                    return ListTile(
                      title: Text(state),
                      onTap: () {
                        locationNotifier.updateLocationName(state);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCircleAction(BuildContext context, IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onTap,
      ),
    );
  }

  Widget _buildNotificationIcon(WidgetRef ref, List<dynamic> notifications) {
    final unreadCount = ref.read(notificationsProvider.notifier).unreadCount;
    return Stack(
      children: [
        _buildCircleAction(ref.context, Icons.notifications_none, () => ref.context.go('/notifications')),
        if (unreadCount > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppTheme.accentColor,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context, WidgetRef ref) {
    return Hero(
      tag: 'search_bar',
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          boxShadow: AppTheme.shadowLg,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.push('/search'),
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppTheme.primaryColor),
                  const SizedBox(width: 12),
                  Text(
                    'Search for rare treasures...',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textMuted,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                    ),
                    child: Icon(Icons.tune, size: 18, color: AppTheme.primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, Map<String, dynamic> stats) {
    final active = stats['active_auctions'] ?? 0;
    final bids = stats['total_bids'] ?? 0;
    
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        children: [
          _buildStatCard(context, 'Live Items', active.toString(), Icons.live_tv, AppTheme.successColor),
          const SizedBox(width: 12),
          _buildStatCard(context, 'Total Bids', bids.toString(), Icons.gavel, AppTheme.primaryColor),
          const SizedBox(width: 12),
          _buildStatCard(context, 'Verified Sellers', '1.2k', Icons.verified_user, AppTheme.accentColor),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, IconData icon, Color color) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16)),
              Text(label, style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionItem(context, Icons.sell, 'Sell', AppTheme.primaryColor, () => context.go('/select-category')),
        _buildActionItem(context, Icons.history, 'Activity', AppTheme.accentColor, () => context.go('/profile/purchase-history')),
        _buildActionItem(context, Icons.account_balance_wallet, 'Wallet', AppTheme.successColor, () {}),
        _buildActionItem(context, Icons.support_agent, 'Help', AppTheme.infoColor, () => context.go('/profile/help-support')),
      ],
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title, {
    String? subtitle,
    VoidCallback? onViewAll,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              if (subtitle != null)
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const Spacer(),
          if (onViewAll != null)
            TextButton(
              onPressed: onViewAll,
              child: const Text('View All', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }

  Widget _buildFeaturedAuctions(BuildContext context, List<Auction> auctions) {
    if (auctions.isEmpty) {
      return _buildEmptyState('Loading today\'s top items...');
    }

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        itemCount: auctions.length,
        itemBuilder: (context, index) {
          final auction = auctions[index];
          return _buildPremiumAuctionCard(context, auction, index, auctions.length);
        },
      ),
    );
  }

  Widget _buildPremiumAuctionCard(
    BuildContext context,
    Auction auction,
    int index,
    int total,
  ) {
    final productName = auction.dynamicAttributes['productName'] ?? 'Rare Find';
    final imageUrl = auction.images.isNotEmpty ? auction.images.first : null;
    final timeLeft = auction.endTime.difference(DateTime.now());
    
    return GestureDetector(
      onTap: () => context.push('/auctions/${auction.id}'),
      child: Container(
        width: 240,
        margin: EdgeInsets.only(right: index == total - 1 ? 0 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppTheme.shadowMd,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: imageUrl != null
                        ? Image.network(
                            imageUrl, 
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Center(
                              child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
                            ),
                          )
                        : const Icon(Icons.image_outlined, size: 50, color: Colors.grey),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.timer, size: 10, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          '${timeLeft.inHours}h',
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                if (auction.currentPrice > 1000)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: AppTheme.warningColor, shape: BoxShape.circle),
                      child: const Icon(Icons.local_fire_department, size: 12, color: Colors.white),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Current Bid', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                          Text(
                            '${auction.currency ?? 'INR'} ${auction.currentPrice.toStringAsFixed(0)}',
                            style: const TextStyle(fontWeight: FontWeight.w900, color: AppTheme.primaryColor, fontSize: 16),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Bid', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
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

  Widget _buildTrendingCategories(
    BuildContext context,
    List<Category> categories,
  ) {
    if (categories.isEmpty) {
      return _buildEmptyState('Fetching categories...');
    }

    final displayCategories = categories.take(8).toList();
    
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        itemCount: displayCategories.length,
        itemBuilder: (context, index) {
          final category = displayCategories[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => context.go('/auctions?categoryId=${category.id}'),
              child: Column(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: AppTheme.shadowSm,
                      border: Border.all(color: AppTheme.dividerColor),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: category.iconUrl != null && category.iconUrl!.isNotEmpty
                        ? Image.network(
                            category.iconUrl!,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.category, color: AppTheme.primaryColor),
                          )
                        : Icon(Icons.category, color: AppTheme.primaryColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.name,
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEndingSoon(BuildContext context, List<Auction> auctions) {
    if (auctions.isEmpty) {
      return _buildEmptyState('No items ending right now.');
    }

    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        itemCount: auctions.length,
        itemBuilder: (context, index) {
          final auction = auctions[index];
          final productName = auction.dynamicAttributes['productName'] ?? 'Rare Item';
          final timeLeft = auction.endTime.difference(DateTime.now());
          final isUrgent = timeLeft.inMinutes < 60;

          return GestureDetector(
            onTap: () => context.push('/auctions/${auction.id}'),
            child: Container(
              width: 280,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isUrgent ? AppTheme.errorColor.withOpacity(0.3) : AppTheme.dividerColor),
                boxShadow: AppTheme.shadowSm,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[100],
                      child: auction.images.isNotEmpty 
                          ? Image.network(
                              auction.images.first, 
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: AppTheme.textMuted),
                            )
                          : const Icon(Icons.timer, color: AppTheme.textMuted),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${auction.currency ?? 'INR'} ${auction.currentPrice.toStringAsFixed(0)}',
                          style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.w900, fontSize: 14),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: isUrgent ? AppTheme.errorColor.withOpacity(0.1) : Colors.grey[100],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.access_time, size: 10, color: isUrgent ? AppTheme.errorColor : AppTheme.textSecondary),
                              const SizedBox(width: 4),
                              Text(
                                isUrgent ? '${timeLeft.inMinutes}m left' : '${timeLeft.inHours}h left',
                                style: TextStyle(
                                  color: isUrgent ? AppTheme.errorColor : AppTheme.textSecondary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNearbyDeals(BuildContext context, List<Product> products, {bool isLoading = false}) {
    if (isLoading) {
      return Container(
        height: 180,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (products.isEmpty) {
      return _buildEmptyState('No items found near your current location.');
    }

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final imageUrl = product.images.isNotEmpty ? product.images.first : null;
          
          return GestureDetector(
            onTap: () {
              // Navigate to product details
              context.pushNamed('product-details', extra: product);
            },
            child: Container(
              width: 160,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: AppTheme.shadowSm,
                border: Border.all(color: AppTheme.dividerColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Container(
                            width: double.infinity,
                            color: Colors.grey[100],
                            child: imageUrl != null 
                              ? Image.network(
                                  imageUrl, 
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => const Center(
                                    child: Icon(Icons.broken_image, color: Colors.grey),
                                  ),
                                )
                              : const Icon(Icons.image_outlined, color: Colors.grey),
                          ),
                        ),
                        if (product.distanceKm != null)
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${product.distanceKm!.toStringAsFixed(1)} km',
                                style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Text(
                            '${product.currency} ${product.price.toStringAsFixed(0)}',
                            style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.w900, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Center(
        child: Text(
          message,
          style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading your auctions...'),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error, required this.onRetry});

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppTheme.errorColor,
            ),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: TextStyle(color: AppTheme.textMuted),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: onRetry, child: const Text('Try Again')),
          ],
        ),
      ),
    );
  }
}

class _LoginPromptView extends StatelessWidget {
  const _LoginPromptView({required this.onLoginTap});

  final VoidCallback onLoginTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock_outline,
                size: 64,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                'Session Expired',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Your session has expired. Please log in again to continue.',
                style: TextStyle(color: AppTheme.textMuted),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onLoginTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
