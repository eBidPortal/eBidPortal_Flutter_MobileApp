import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_item.freezed.dart';
part 'watchlist_item.g.dart';

@freezed
class WatchlistItem with _$WatchlistItem {
  const factory WatchlistItem({
    required String id,
    required String auctionId,
    required String userId,
    required DateTime addedAt,
    // Include auction data for display
    String? auctionTitle,
    double? currentBid,
    double? startingPrice,
    String? status,
    DateTime? endTime,
    List<String>? images,
  }) = _WatchlistItem;

  factory WatchlistItem.fromJson(Map<String, dynamic> json) => _$WatchlistItemFromJson(json);
}