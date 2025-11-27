import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/auction_repository.dart';
import '../domain/auction.dart';

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
