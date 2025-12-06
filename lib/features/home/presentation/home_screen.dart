import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('🏠 SCREEN: HomeScreen - build called');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: AppTheme.surfaceColor,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Guest!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Find your next treasure',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  // TODO: Navigate to notifications
                },
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
                  child: _buildSearchBar(context),
                ),
                
                // Promotional Banner
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
                  child: _buildPromoBanner(context),
                ),
                
                const SizedBox(height: AppTheme.spacingLg),
                
                // Quick Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
                  child: _buildQuickActions(context),
                ),
                
                const SizedBox(height: AppTheme.spacingXl),
                
                // Featured Auctions Section
                _buildSectionHeader(context, 'Featured Auctions', onViewAll: () {}),
                const SizedBox(height: AppTheme.spacingMd),
                _buildFeaturedAuctions(),
                
                const SizedBox(height: AppTheme.spacingXl),
                
                // Trending Categories Section
                _buildSectionHeader(context, 'Trending Categories', onViewAll: () {}),
                const SizedBox(height: AppTheme.spacingMd),
                _buildTrendingCategories(),
                
                const SizedBox(height: AppTheme.spacingXl),
                
                // Ending Soon Section
                _buildSectionHeader(context, 'Ending Soon', onViewAll: () {}),
                const SizedBox(height: AppTheme.spacingMd),
                _buildEndingSoon(),
                
                const SizedBox(height: AppTheme.spacingXl),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppTheme.borderColor),
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
          // TODO: Navigate to search
        },
        readOnly: true,
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
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
              '🔥 Hot Auctions Live Now!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Don\'t miss out on exclusive deals',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppTheme.primaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
              child: const Text('Explore Now', style: TextStyle(fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildQuickActionCard(context, Icons.category, 'Categories', AppTheme.primaryColor)),
        const SizedBox(width: AppTheme.spacingMd),
        Expanded(child: _buildQuickActionCard(context, Icons.local_fire_department, 'Hot Deals', AppTheme.accentColor)),
        const SizedBox(width: AppTheme.spacingMd),
        Expanded(child: _buildQuickActionCard(context, Icons.access_time, 'Ending Soon', AppTheme.warningColor)),
      ],
    );
  }

  Widget _buildQuickActionCard(BuildContext context, IconData icon, String label, Color color) {
    return Container(
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

  Widget _buildFeaturedAuctions() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 280,
            margin: EdgeInsets.only(right: index < 4 ? AppTheme.spacingMd : 0),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              border: Border.all(color: AppTheme.borderColor),
              boxShadow: AppTheme.shadowSm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(AppTheme.radiusMd)),
                  child: Container(
                    height: 120,
                    color: AppTheme.borderColor,
                    child: const Icon(Icons.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Featured Auction Item #$index',
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
                            '\$${(index + 1) * 100}',
                            style: const TextStyle(
                              color: AppTheme.successColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.access_time, size: 14, color: AppTheme.textMuted),
                          const SizedBox(width: 4),
                          const Text(
                            '2h left',
                            style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendingCategories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        itemCount: 6,
        itemBuilder: (context, index) {
          final icons = [Icons.directions_car, Icons.laptop, Icons.watch, Icons.sports_basketball, Icons.chair, Icons.diamond];
          final labels = ['Cars', 'Electronics', 'Watches', 'Sports', 'Furniture', 'Jewelry'];
          
          return Container(
            width: 90,
            margin: EdgeInsets.only(right: index < 5 ? AppTheme.spacingMd : 0),
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
                  child: Icon(icons[index], color: Colors.white, size: 28),
                ),
                const SizedBox(height: 8),
                Text(
                  labels[index],
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEndingSoon() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            margin: EdgeInsets.only(right: index < 3 ? AppTheme.spacingMd : 0),
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              border: Border.all(color: AppTheme.borderColor),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                    color: AppTheme.borderColor,
                  ),
                  child: const Icon(Icons.image),
                ),
                const SizedBox(width: AppTheme.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Item #$index',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${(index + 1) * 50}',
                        style: const TextStyle(color: AppTheme.successColor, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      const Row(
                        children: [
                          Icon(Icons.timer, size: 12, color: AppTheme.errorColor),
                          SizedBox(width: 4),
                          Text(
                            '30m left',
                            style: TextStyle(fontSize: 11, color: AppTheme.errorColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
