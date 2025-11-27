import 'package:freezed_annotation/freezed_annotation.dart';

part 'auction.freezed.dart';
part 'auction.g.dart';

@freezed
class Auction with _$Auction {
  const factory Auction({
    required String id,
    required String title,
    String? description,
    double? currentBid,
    double? startPrice,
    double? reservePrice,
    double? buyNowPrice,
    required String status,
    required DateTime startTime,
    required DateTime endTime,
    @Default([]) List<String> images,
    String? categoryId,
    String? sellerId,
    @Default(0) int bidCount,
    @Default(0) int watchersCount,
  }) = _Auction;

  factory Auction.fromJson(Map<String, dynamic> json) => _$AuctionFromJson(json);
}
