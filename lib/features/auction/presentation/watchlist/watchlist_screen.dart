import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../auction_provider.dart';
import '../../widgets/auction_card.dart';

class WatchlistScreen extends ConsumerWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistAsync = ref.watch(watchlistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: watchlistAsync.when(
        data: (watchlistItems) {
          if (watchlistItems.isEmpty) {
            return _EmptyWatchlistView();
          }

          return _WatchlistView(watchlistItems: watchlistItems);
        },
        loading: () => const _LoadingView(),
        error: (error, stack) => _ErrorView(
          error: error.toString(),
          onRetry: () => ref.invalidate(watchlistProvider),
        ),
      ),
    );
  }
}

class _WatchlistView extends ConsumerWidget {
  final List<dynamic> watchlistItems;

  const _WatchlistView({required this.watchlistItems});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(watchlistProvider);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        itemCount: watchlistItems.length,
        itemBuilder: (context, index) {
          final item = watchlistItems[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingMd),
            child: AuctionCard(
              auction: item.auction,
              onTap: () {
                context.push('/auctions/${item.auction.id}');
              },
              showWatchlistButton: true,
            ),
          );
        },
      ),
    );
  }
}

class _EmptyWatchlistView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: AppTheme.spacingLg),
          Text(
            'Your watchlist is empty',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: AppTheme.spacingMd),
          Text(
            'Add auctions to your watchlist to keep track of items you\'re interested in.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingXl),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to auctions screen
              context.go('/auctions');
            },
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
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red[400],
          ),
          const SizedBox(height: AppTheme.spacingLg),
          Text(
            'Failed to load watchlist',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: AppTheme.spacingMd),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingXl),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}