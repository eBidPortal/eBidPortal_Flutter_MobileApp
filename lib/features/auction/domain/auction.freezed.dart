// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Auction _$AuctionFromJson(Map<String, dynamic> json) {
  return _Auction.fromJson(json);
}

/// @nodoc
mixin _$Auction {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get currentBid => throw _privateConstructorUsedError;
  double? get startPrice => throw _privateConstructorUsedError;
  double? get reservePrice => throw _privateConstructorUsedError;
  double? get buyNowPrice => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get sellerId => throw _privateConstructorUsedError;
  int get bidCount => throw _privateConstructorUsedError;
  int get watchersCount => throw _privateConstructorUsedError;

  /// Serializes this Auction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Auction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuctionCopyWith<Auction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuctionCopyWith<$Res> {
  factory $AuctionCopyWith(Auction value, $Res Function(Auction) then) =
      _$AuctionCopyWithImpl<$Res, Auction>;
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    double? currentBid,
    double? startPrice,
    double? reservePrice,
    double? buyNowPrice,
    String status,
    DateTime startTime,
    DateTime endTime,
    List<String> images,
    String? categoryId,
    String? sellerId,
    int bidCount,
    int watchersCount,
  });
}

/// @nodoc
class _$AuctionCopyWithImpl<$Res, $Val extends Auction>
    implements $AuctionCopyWith<$Res> {
  _$AuctionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Auction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? currentBid = freezed,
    Object? startPrice = freezed,
    Object? reservePrice = freezed,
    Object? buyNowPrice = freezed,
    Object? status = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? images = null,
    Object? categoryId = freezed,
    Object? sellerId = freezed,
    Object? bidCount = null,
    Object? watchersCount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentBid: freezed == currentBid
                ? _value.currentBid
                : currentBid // ignore: cast_nullable_to_non_nullable
                      as double?,
            startPrice: freezed == startPrice
                ? _value.startPrice
                : startPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            reservePrice: freezed == reservePrice
                ? _value.reservePrice
                : reservePrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            buyNowPrice: freezed == buyNowPrice
                ? _value.buyNowPrice
                : buyNowPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sellerId: freezed == sellerId
                ? _value.sellerId
                : sellerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bidCount: null == bidCount
                ? _value.bidCount
                : bidCount // ignore: cast_nullable_to_non_nullable
                      as int,
            watchersCount: null == watchersCount
                ? _value.watchersCount
                : watchersCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuctionImplCopyWith<$Res> implements $AuctionCopyWith<$Res> {
  factory _$$AuctionImplCopyWith(
    _$AuctionImpl value,
    $Res Function(_$AuctionImpl) then,
  ) = __$$AuctionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    double? currentBid,
    double? startPrice,
    double? reservePrice,
    double? buyNowPrice,
    String status,
    DateTime startTime,
    DateTime endTime,
    List<String> images,
    String? categoryId,
    String? sellerId,
    int bidCount,
    int watchersCount,
  });
}

/// @nodoc
class __$$AuctionImplCopyWithImpl<$Res>
    extends _$AuctionCopyWithImpl<$Res, _$AuctionImpl>
    implements _$$AuctionImplCopyWith<$Res> {
  __$$AuctionImplCopyWithImpl(
    _$AuctionImpl _value,
    $Res Function(_$AuctionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Auction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? currentBid = freezed,
    Object? startPrice = freezed,
    Object? reservePrice = freezed,
    Object? buyNowPrice = freezed,
    Object? status = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? images = null,
    Object? categoryId = freezed,
    Object? sellerId = freezed,
    Object? bidCount = null,
    Object? watchersCount = null,
  }) {
    return _then(
      _$AuctionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentBid: freezed == currentBid
            ? _value.currentBid
            : currentBid // ignore: cast_nullable_to_non_nullable
                  as double?,
        startPrice: freezed == startPrice
            ? _value.startPrice
            : startPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        reservePrice: freezed == reservePrice
            ? _value.reservePrice
            : reservePrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        buyNowPrice: freezed == buyNowPrice
            ? _value.buyNowPrice
            : buyNowPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sellerId: freezed == sellerId
            ? _value.sellerId
            : sellerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bidCount: null == bidCount
            ? _value.bidCount
            : bidCount // ignore: cast_nullable_to_non_nullable
                  as int,
        watchersCount: null == watchersCount
            ? _value.watchersCount
            : watchersCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuctionImpl implements _Auction {
  const _$AuctionImpl({
    required this.id,
    required this.title,
    this.description,
    this.currentBid,
    this.startPrice,
    this.reservePrice,
    this.buyNowPrice,
    required this.status,
    required this.startTime,
    required this.endTime,
    final List<String> images = const [],
    this.categoryId,
    this.sellerId,
    this.bidCount = 0,
    this.watchersCount = 0,
  }) : _images = images;

  factory _$AuctionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuctionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final double? currentBid;
  @override
  final double? startPrice;
  @override
  final double? reservePrice;
  @override
  final double? buyNowPrice;
  @override
  final String status;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String? categoryId;
  @override
  final String? sellerId;
  @override
  @JsonKey()
  final int bidCount;
  @override
  @JsonKey()
  final int watchersCount;

  @override
  String toString() {
    return 'Auction(id: $id, title: $title, description: $description, currentBid: $currentBid, startPrice: $startPrice, reservePrice: $reservePrice, buyNowPrice: $buyNowPrice, status: $status, startTime: $startTime, endTime: $endTime, images: $images, categoryId: $categoryId, sellerId: $sellerId, bidCount: $bidCount, watchersCount: $watchersCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuctionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currentBid, currentBid) ||
                other.currentBid == currentBid) &&
            (identical(other.startPrice, startPrice) ||
                other.startPrice == startPrice) &&
            (identical(other.reservePrice, reservePrice) ||
                other.reservePrice == reservePrice) &&
            (identical(other.buyNowPrice, buyNowPrice) ||
                other.buyNowPrice == buyNowPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.bidCount, bidCount) ||
                other.bidCount == bidCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    currentBid,
    startPrice,
    reservePrice,
    buyNowPrice,
    status,
    startTime,
    endTime,
    const DeepCollectionEquality().hash(_images),
    categoryId,
    sellerId,
    bidCount,
    watchersCount,
  );

  /// Create a copy of Auction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuctionImplCopyWith<_$AuctionImpl> get copyWith =>
      __$$AuctionImplCopyWithImpl<_$AuctionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuctionImplToJson(this);
  }
}

abstract class _Auction implements Auction {
  const factory _Auction({
    required final String id,
    required final String title,
    final String? description,
    final double? currentBid,
    final double? startPrice,
    final double? reservePrice,
    final double? buyNowPrice,
    required final String status,
    required final DateTime startTime,
    required final DateTime endTime,
    final List<String> images,
    final String? categoryId,
    final String? sellerId,
    final int bidCount,
    final int watchersCount,
  }) = _$AuctionImpl;

  factory _Auction.fromJson(Map<String, dynamic> json) = _$AuctionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  double? get currentBid;
  @override
  double? get startPrice;
  @override
  double? get reservePrice;
  @override
  double? get buyNowPrice;
  @override
  String get status;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  List<String> get images;
  @override
  String? get categoryId;
  @override
  String? get sellerId;
  @override
  int get bidCount;
  @override
  int get watchersCount;

  /// Create a copy of Auction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuctionImplCopyWith<_$AuctionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
