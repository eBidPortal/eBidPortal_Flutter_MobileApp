import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/providers/location_provider.dart';
import '../../../core/services/notification_service.dart';
import '../../auction/domain/auction.dart';
import '../../catalog/domain/category.dart';
import '../providers/home_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('🏠 SCREEN: HomeScreen - build called');

    final homeData = ref.watch(homeDataProvider);
    final locationState = ref.watch(locationProvider);
    final notifications = ref.watch(notificationsProvider);

    return Scaffold(
      body: homeData.isLoading
          ? const _LoadingView()
          : homeData.error != null
              ? _ErrorView(error: homeData.error!, onRetry: () {
                  ref.read(homeDataProvider.notifier).refreshData();
                })
              : CustomScrollView(
                  slivers: [
                    // App Bar
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      backgroundColor: AppTheme.surfaceColor,
                      elevation: 0,
                      title: InkWell(
                        onTap: () => _showLocationSelector(context, ref),
                        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 20,
                                  color: AppTheme.primaryColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _getLocationText(locationState),
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                  color: AppTheme.primaryColor,
                                ),
                              ],
                            ),
                            Text(
                              'Find your next treasure',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () => context.go('/watchlist'),
                        ),
                        Stack(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.notifications_outlined),
                              onPressed: () => context.go('/notifications'),
                            ),
                            if (notifications.isNotEmpty && ref.read(notificationsProvider.notifier).unreadCount > 0)
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 16,
                                    minHeight: 16,
                                  ),
                                  child: Text(
                                    ref.read(notificationsProvider.notifier).unreadCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),

                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Search Bar
                          Padding(
                            padding: const EdgeInsets.all(AppTheme.spacingMd),
                            child: _buildSearchBar(context, ref),
                          ),

                          // Promotional Banner
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
                            child: _buildPromoBanner(context, homeData.stats),
                          ),

                          const SizedBox(height: AppTheme.spacingLg),

                          // Quick Actions
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
                            child: _buildQuickActions(context),
                          ),

                          const SizedBox(height: AppTheme.spacingXl),

                          // Featured Auctions Section
                          _buildSectionHeader(
                            context,
                            'Featured Auctions',
                            onViewAll: () => context.go('/auctions'),
                          ),
                          const SizedBox(height: AppTheme.spacingMd),
                          _buildFeaturedAuctions(context, homeData.featuredAuctions),

                          const SizedBox(height: AppTheme.spacingXl),

                          // Trending Categories Section
                          _buildSectionHeader(
                            context,
                            'Trending Categories',
                            onViewAll: () => context.go('/categories'),
                          ),
                          const SizedBox(height: AppTheme.spacingMd),
                          _buildTrendingCategories(context, homeData.trendingCategories),

                          const SizedBox(height: AppTheme.spacingXl),

                          // Ending Soon Section
                          _buildSectionHeader(
                            context,
                            'Ending Soon',
                            onViewAll: () => context.go('/auctions?filter=ending_soon'),
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
    return locationState.locationName ?? 'Select Location';
  }

  void _showLocationSelector(BuildContext context, WidgetRef ref) {
    final locationNotifier = ref.read(locationProvider.notifier);
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
                    'Select Your State',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
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
                      final locationNotifier = ref.read(locationProvider.notifier);
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

  Widget _buildSearchBar(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppTheme.borderColor),
        boxShadow: AppTheme.shadowSm,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search auctions, categories...',
          prefixIcon: const Icon(Icons.search, color: AppTheme.textMuted),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: 14,
          ),
        ),
        onTap: () {
          // Navigate to search screen
          context.go('/search');
        },
        readOnly: true,
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context, Map<String, dynamic> stats) {
    final activeAuctions = stats['active_auctions'] ?? 0;
    final totalBids = stats['total_bids'] ?? 0;

    return Container(
      height: 160,
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: AppTheme.shadowMd,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🔥 Live Auctions Now!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$activeAuctions active auctions • $totalBids total bids',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/auctions'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppTheme.primaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
              child: const Text('Browse Auctions', style: TextStyle(fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildQuickActionCard(
          context,
          Icons.category,
          'Categories',
          AppTheme.primaryColor,
          () => context.go('/categories'),
        )),
        const SizedBox(width: AppTheme.spacingMd),
        Expanded(child: _buildQuickActionCard(
          context,
          Icons.local_fire_department,
          'Hot Deals',
          AppTheme.accentColor,
          () => context.go('/auctions?filter=featured'),
        )),
        const SizedBox(width: AppTheme.spacingMd),
        Expanded(child: _buildQuickActionCard(
          context,
          Icons.access_time,
          'Ending Soon',
          AppTheme.warningColor,
          () => context.go('/auctions?filter=ending_soon'),
        )),
      ],
    );
  }

  Widget _buildQuickActionCard(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, {VoidCallback? onViewAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (onViewAll != null)
            TextButton(
              onPressed: onViewAll,
              child: const Text('View All'),
            ),
        ],
      ),
    );
  }

  Widget _buildFeaturedAuctions(BuildContext context, List<Auction> auctions) {
    if (auctions.isEmpty) {
      return _buildEmptyState('No featured auctions available');
    }

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        itemCount: auctions.length,
        itemBuilder: (context, index) {
          final auction = auctions[index];
          return _buildAuctionCard(context, auction, index, auctions.length);
        },
      ),
    );
  }

  Widget _buildAuctionCard(BuildContext context, Auction auction, int index, int total) {
    final productName = auction.dynamicAttributes['productName'] ?? 'Unnamed Item';
    final imageUrl = auction.dynamicAttributes['images'] != null &&
                     auction.dynamicAttributes['images'] is List &&
                     (auction.dynamicAttributes['images'] as List).isNotEmpty
        ? (auction.dynamicAttributes['images'] as List).first
        : null;

    final timeLeft = auction.endTime.difference(DateTime.now());
    final timeLeftText = timeLeft.inHours > 0
        ? '${timeLeft.inHours}h left'
        : timeLeft.inMinutes > 0
            ? '${timeLeft.inMinutes}m left'
            : 'Ending soon';

    return InkWell(
      onTap: () => context.go('/auctions/${auction.id}'),
      child: Container(
        width: 280,
        margin: EdgeInsets.only(right: index < total - 1 ? AppTheme.spacingMd : 0),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(color: AppTheme.borderColor),
          boxShadow: AppTheme.shadowSm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(AppTheme.radiusMd)),
              child: Container(
                height: 120,
                width: double.infinity,
                color: AppTheme.borderColor,
                child: imageUrl != null
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image, size: 40, color: AppTheme.textMuted),
                      )
                    : const Icon(Icons.image, size: 40, color: AppTheme.textMuted),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.attach_money, size: 16, color: AppTheme.successColor),
                      Text(
                        '\$${auction.currentPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: AppTheme.successColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.access_time, size: 14, color: AppTheme.textMuted),
                      const SizedBox(width: 4),
                      Text(
                        timeLeftText,
                        style: const TextStyle(fontSize: 12, color: AppTheme.textMuted),
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

  Widget _buildTrendingCategories(BuildContext context, List<Category> categories) {
    if (categories.isEmpty) {
      return _buildEmptyState('No categories available');
    }

    final displayCategories = categories.take(6).toList();
    final icons = [Icons.directions_car, Icons.laptop, Icons.watch, Icons.sports_basketball, Icons.chair, Icons.diamond];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        itemCount: displayCategories.length,
        itemBuilder: (context, index) {
          final category = displayCategories[index];
          final icon = icons.length > index ? icons[index] : Icons.category;

          return InkWell(
            onTap: () => context.go('/auctions?category=${category.id}'),
            child: Container(
              width: 90,
              margin: EdgeInsets.only(right: index < displayCategories.length - 1 ? AppTheme.spacingMd : 0),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                      boxShadow: AppTheme.shadowSm,
                    ),
                    child: Icon(icon, color: Colors.white, size: 28),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.name,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    maxLines: 1,
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
      return _buildEmptyState('No auctions ending soon');
    }

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: auctions.length,
        itemBuilder: (context, index) {
          final auction = auctions[index];
          final productName = auction.dynamicAttributes['productName'] ?? 'Unnamed Item';
          final timeLeft = auction.endTime.difference(DateTime.now());
          final timeLeftText = timeLeft.inHours > 0
              ? '${timeLeft.inHours}h left'
              : timeLeft.inMinutes > 0
                  ? '${timeLeft.inMinutes}m left'
                  : 'Ending now';

          return InkWell(
            onTap: () => context.go('/auctions/${auction.id}'),
            child: Container(
              width: 200,
              margin: EdgeInsets.only(right: index < auctions.length - 1 ? AppTheme.spacingMd : 0),
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                border: Border.all(color: AppTheme.borderColor),
                boxShadow: AppTheme.shadowSm,
              ),
              child: Row(
                children: [
                  // Image
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      color: AppTheme.borderColor,
                    ),
                    child: const Icon(Icons.image, color: AppTheme.textMuted),
                  ),
                  const SizedBox(width: AppTheme.spacingMd),
                  // Content
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
                          '\$${auction.currentPrice.toStringAsFixed(2)}',
                          style: const TextStyle(color: AppTheme.successColor, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 12,
                              color: timeLeft.inMinutes < 30 ? AppTheme.errorColor : AppTheme.warningColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              timeLeftText,
                              style: TextStyle(
                                fontSize: 11,
                                color: timeLeft.inMinutes < 30 ? AppTheme.errorColor : AppTheme.warningColor,
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
