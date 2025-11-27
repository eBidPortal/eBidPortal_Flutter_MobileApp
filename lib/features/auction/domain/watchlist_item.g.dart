// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchlistItemImpl _$$WatchlistItemImplFromJson(Map<String, dynamic> json) =>
    _$WatchlistItemImpl(
      id: json['id'] as String,
      auctionId: json['auctionId'] as String,
      userId: json['userId'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
      auctionTitle: json['auctionTitle'] as String?,
      currentBid: (json['currentBid'] as num?)?.toDouble(),
      startingPrice: (json['startingPrice'] as num?)?.toDouble(),
      status: json['status'] as String?,
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$WatchlistItemImplToJson(_$WatchlistItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'auctionId': instance.auctionId,
      'userId': instance.userId,
      'addedAt': instance.addedAt.toIso8601String(),
      'auctionTitle': instance.auctionTitle,
      'currentBid': instance.currentBid,
      'startingPrice': instance.startingPrice,
      'status': instance.status,
      'endTime': instance.endTime?.toIso8601String(),
      'images': instance.images,
    };
