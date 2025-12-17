import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/auction_repository.dart';
import '../domain/auction.dart';
import '../domain/watchlist_item.dart';

part 'auction_provider.g.dart';

@riverpod
class AuctionList extends _$AuctionList {
  @override
  FutureOr<List<Auction>> build({
    String? categoryId,
    String? search,
  }) async {
    final repository = ref.watch(auctionRepositoryProvider);
    return repository.getAuctions(
      categoryId: categoryId,
      search: search,
      status: 'active', // Default to active auctions
    );
  }
}

@riverpod
Future<Auction> auctionDetail(ref, String auctionId) async {
  final repository = ref.watch(auctionRepositoryProvider);
  return repository.getAuctionById(auctionId);
}

@riverpod
Future<List<WatchlistItem>> watchlist(ref) async {
  final repository = ref.watch(auctionRepositoryProvider);
  return repository.getWatchlist();
}

@riverpod
Future<bool> isInWatchlist(ref, String auctionId) async {
  final watchlist = await ref.watch(watchlistProvider.future);
  return watchlist.any((item) => item.auction.id == auctionId);
}

@riverpod
class WatchlistActions extends _$WatchlistActions {
  @override
  FutureOr<void> build() async {
    // No initial state needed
  }

  Future<void> toggleWatchlist(String auctionId) async {
    final repository = ref.read(auctionRepositoryProvider);
    final isInWatchlist = await ref.read(isInWatchlistProvider(auctionId).future);

    try {
      if (isInWatchlist) {
        await repository.removeFromWatchlist(auctionId);
      } else {
        await repository.addToWatchlist(auctionId);
      }
      // Invalidate watchlist to refresh
      ref.invalidate(watchlistProvider);
      ref.invalidate(isInWatchlistProvider(auctionId));
    } catch (e) {
      // Handle error - could add error state here
      rethrow;
    }
  }
}

@riverpod
@riverpod
Future<List<Map<String, dynamic>>> auctionBids(ref, String auctionId) async {
  final repository = ref.watch(auctionRepositoryProvider);
  return repository.getAuctionBids(auctionId);
}

@riverpod
class PlaceBid extends _$PlaceBid {
  @override
  FutureOr<Map<String, dynamic>?> build() async {
    return null; // No initial state
  }

  Future<Map<String, dynamic>> placeBid(String auctionId, double bidAmount) async {
    final repository = ref.read(auctionRepositoryProvider);

    try {
      final result = await repository.placeBid(auctionId, bidAmount);
      // Invalidate auction details to refresh current price
      ref.invalidate(auctionDetailProvider(auctionId));
      // Invalidate bids list
      ref.invalidate(auctionBidsProvider(auctionId));
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
