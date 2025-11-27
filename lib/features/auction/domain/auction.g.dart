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
      currentBid: (json['currentBid'] as num?)?.toDouble(),
      startPrice: (json['startPrice'] as num?)?.toDouble(),
      reservePrice: (json['reservePrice'] as num?)?.toDouble(),
      buyNowPrice: (json['buyNowPrice'] as num?)?.toDouble(),
      status: json['status'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      categoryId: json['categoryId'] as String?,
      sellerId: json['sellerId'] as String?,
      bidCount: (json['bidCount'] as num?)?.toInt() ?? 0,
      watchersCount: (json['watchersCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AuctionImplToJson(_$AuctionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'currentBid': instance.currentBid,
      'startPrice': instance.startPrice,
      'reservePrice': instance.reservePrice,
      'buyNowPrice': instance.buyNowPrice,
      'status': instance.status,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'images': instance.images,
      'categoryId': instance.categoryId,
      'sellerId': instance.sellerId,
      'bidCount': instance.bidCount,
      'watchersCount': instance.watchersCount,
    };
