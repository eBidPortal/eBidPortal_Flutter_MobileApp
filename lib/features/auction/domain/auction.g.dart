// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuctionImpl _$$AuctionImplFromJson(Map<String, dynamic> json) =>
    _$AuctionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      currentBid: (json['current_bid'] as num?)?.toDouble(),
      startPrice: (json['start_price'] as num?)?.toDouble(),
      reservePrice: (json['reserve_price'] as num?)?.toDouble(),
      buyNowPrice: (json['buy_now_price'] as num?)?.toDouble(),
      status: json['status'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      categoryId: json['category_id'] as String?,
      sellerId: json['seller_id'] as String?,
      bidCount: (json['bid_count'] as num?)?.toInt() ?? 0,
      watchersCount: (json['watchers_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AuctionImplToJson(_$AuctionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'current_bid': instance.currentBid,
      'start_price': instance.startPrice,
      'reserve_price': instance.reservePrice,
      'buy_now_price': instance.buyNowPrice,
      'status': instance.status,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'images': instance.images,
      'category_id': instance.categoryId,
      'seller_id': instance.sellerId,
      'bid_count': instance.bidCount,
      'watchers_count': instance.watchersCount,
    };
