import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auction_provider.dart';
import '../domain/auction.dart';

class AuctionListScreen extends ConsumerWidget {
  final String? categoryId;
  final String? search;

  const AuctionListScreen({
    super.key,
    this.categoryId,
    this.search,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auctionsAsync = ref.watch(auctionListProvider(categoryId: categoryId, search: search));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auctions'),
      ),
      body: auctionsAsync.when(
        data: (auctions) => _AuctionList(auctions: auctions),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _AuctionList extends StatelessWidget {
  final List<Auction> auctions;

  const _AuctionList({required this.auctions});

  @override
  Widget build(BuildContext context) {
    if (auctions.isEmpty) {
      return const Center(child: Text('No auctions found'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: auctions.length,
      itemBuilder: (context, index) {
        final auction = auctions[index];
        return _AuctionCard(auction: auction);
      },
    );
  }
}

class _AuctionCard extends StatelessWidget {
  final Auction auction;

  const _AuctionCard({required this.auction});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: auction.images.isNotEmpty
                ? Image.network(
                    auction.images.first,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported, size: 50),
                  )
                : const Center(child: Icon(Icons.image, size: 50)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  auction.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Bid: \$${auction.currentBid ?? auction.startPrice}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${auction.bidCount} Bids',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Ends: ${auction.endTime.toLocal()}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
