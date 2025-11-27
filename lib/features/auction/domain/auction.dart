import 'package:freezed_annotation/freezed_annotation.dart';

part 'auction.freezed.dart';
part 'auction.g.dart';

@freezed
class Auction with _$Auction {
  const factory Auction({
    required String id,
    required String title,
    String? description,
    @JsonKey(name: 'current_bid') double? currentBid,
    @JsonKey(name: 'start_price') double? startPrice,
    @JsonKey(name: 'reserve_price') double? reservePrice,
    @JsonKey(name: 'buy_now_price') double? buyNowPrice,
    required String status,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @Default([]) List<String> images,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'seller_id') String? sellerId,
    @JsonKey(name: 'bid_count') @Default(0) int bidCount,
    @JsonKey(name: 'watchers_count') @Default(0) int watchersCount,
  }) = _Auction;

  factory Auction.fromJson(Map<String, dynamic> json) => _$AuctionFromJson(json);
}
