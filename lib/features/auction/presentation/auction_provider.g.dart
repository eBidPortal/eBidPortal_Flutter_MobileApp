// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$auctionDetailHash() => r'5148bce322eaf9cb8694ab7204f8e33a167b0b96';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [auctionDetail].
@ProviderFor(auctionDetail)
const auctionDetailProvider = AuctionDetailFamily();

/// See also [auctionDetail].
class AuctionDetailFamily extends Family<AsyncValue<Auction>> {
  /// See also [auctionDetail].
  const AuctionDetailFamily();

  /// See also [auctionDetail].
  AuctionDetailProvider call(String auctionId) {
    return AuctionDetailProvider(auctionId);
  }

  @override
  AuctionDetailProvider getProviderOverride(
    covariant AuctionDetailProvider provider,
  ) {
    return call(provider.auctionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'auctionDetailProvider';
}

/// See also [auctionDetail].
class AuctionDetailProvider extends AutoDisposeFutureProvider<Auction> {
  /// See also [auctionDetail].
  AuctionDetailProvider(String auctionId)
    : this._internal(
        (ref) => auctionDetail(ref as AuctionDetailRef, auctionId),
        from: auctionDetailProvider,
        name: r'auctionDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$auctionDetailHash,
        dependencies: AuctionDetailFamily._dependencies,
        allTransitiveDependencies:
            AuctionDetailFamily._allTransitiveDependencies,
        auctionId: auctionId,
      );

  AuctionDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auctionId,
  }) : super.internal();

  final String auctionId;

  @override
  Override overrideWith(
    FutureOr<Auction> Function(AuctionDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AuctionDetailProvider._internal(
        (ref) => create(ref as AuctionDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auctionId: auctionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Auction> createElement() {
    return _AuctionDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuctionDetailProvider && other.auctionId == auctionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auctionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AuctionDetailRef on AutoDisposeFutureProviderRef<Auction> {
  /// The parameter `auctionId` of this provider.
  String get auctionId;
}

class _AuctionDetailProviderElement
    extends AutoDisposeFutureProviderElement<Auction>
    with AuctionDetailRef {
  _AuctionDetailProviderElement(super.provider);

  @override
  String get auctionId => (origin as AuctionDetailProvider).auctionId;
}

String _$watchlistHash() => r'5119a018b548ed1d1609ae043cb330f5d82a1240';

/// See also [watchlist].
@ProviderFor(watchlist)
final watchlistProvider =
    AutoDisposeFutureProvider<List<WatchlistItem>>.internal(
      watchlist,
      name: r'watchlistProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchlistHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchlistRef = AutoDisposeFutureProviderRef<List<WatchlistItem>>;
String _$isInWatchlistHash() => r'3adeb9f96788942a6a67d63383b510e515b621e6';

/// See also [isInWatchlist].
@ProviderFor(isInWatchlist)
const isInWatchlistProvider = IsInWatchlistFamily();

/// See also [isInWatchlist].
class IsInWatchlistFamily extends Family<AsyncValue<bool>> {
  /// See also [isInWatchlist].
  const IsInWatchlistFamily();

  /// See also [isInWatchlist].
  IsInWatchlistProvider call(String auctionId) {
    return IsInWatchlistProvider(auctionId);
  }

  @override
  IsInWatchlistProvider getProviderOverride(
    covariant IsInWatchlistProvider provider,
  ) {
    return call(provider.auctionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isInWatchlistProvider';
}

/// See also [isInWatchlist].
class IsInWatchlistProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isInWatchlist].
  IsInWatchlistProvider(String auctionId)
    : this._internal(
        (ref) => isInWatchlist(ref as IsInWatchlistRef, auctionId),
        from: isInWatchlistProvider,
        name: r'isInWatchlistProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$isInWatchlistHash,
        dependencies: IsInWatchlistFamily._dependencies,
        allTransitiveDependencies:
            IsInWatchlistFamily._allTransitiveDependencies,
        auctionId: auctionId,
      );

  IsInWatchlistProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auctionId,
  }) : super.internal();

  final String auctionId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(IsInWatchlistRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsInWatchlistProvider._internal(
        (ref) => create(ref as IsInWatchlistRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auctionId: auctionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _IsInWatchlistProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsInWatchlistProvider && other.auctionId == auctionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auctionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsInWatchlistRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `auctionId` of this provider.
  String get auctionId;
}

class _IsInWatchlistProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with IsInWatchlistRef {
  _IsInWatchlistProviderElement(super.provider);

  @override
  String get auctionId => (origin as IsInWatchlistProvider).auctionId;
}

String _$auctionListHash() => r'9dfacbfcc0679a7cc327098e49cd3081ed1ca871';

abstract class _$AuctionList
    extends BuildlessAutoDisposeAsyncNotifier<List<Auction>> {
  late final String? categoryId;
  late final String? search;

  FutureOr<List<Auction>> build({String? categoryId, String? search});
}

/// See also [AuctionList].
@ProviderFor(AuctionList)
const auctionListProvider = AuctionListFamily();

/// See also [AuctionList].
class AuctionListFamily extends Family<AsyncValue<List<Auction>>> {
  /// See also [AuctionList].
  const AuctionListFamily();

  /// See also [AuctionList].
  AuctionListProvider call({String? categoryId, String? search}) {
    return AuctionListProvider(categoryId: categoryId, search: search);
  }

  @override
  AuctionListProvider getProviderOverride(
    covariant AuctionListProvider provider,
  ) {
    return call(categoryId: provider.categoryId, search: provider.search);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'auctionListProvider';
}

/// See also [AuctionList].
class AuctionListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AuctionList, List<Auction>> {
  /// See also [AuctionList].
  AuctionListProvider({String? categoryId, String? search})
    : this._internal(
        () => AuctionList()
          ..categoryId = categoryId
          ..search = search,
        from: auctionListProvider,
        name: r'auctionListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$auctionListHash,
        dependencies: AuctionListFamily._dependencies,
        allTransitiveDependencies: AuctionListFamily._allTransitiveDependencies,
        categoryId: categoryId,
        search: search,
      );

  AuctionListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.search,
  }) : super.internal();

  final String? categoryId;
  final String? search;

  @override
  FutureOr<List<Auction>> runNotifierBuild(covariant AuctionList notifier) {
    return notifier.build(categoryId: categoryId, search: search);
  }

  @override
  Override overrideWith(AuctionList Function() create) {
    return ProviderOverride(
      origin: this,
      override: AuctionListProvider._internal(
        () => create()
          ..categoryId = categoryId
          ..search = search,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AuctionList, List<Auction>>
  createElement() {
    return _AuctionListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuctionListProvider &&
        other.categoryId == categoryId &&
        other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AuctionListRef on AutoDisposeAsyncNotifierProviderRef<List<Auction>> {
  /// The parameter `categoryId` of this provider.
  String? get categoryId;

  /// The parameter `search` of this provider.
  String? get search;
}

class _AuctionListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AuctionList, List<Auction>>
    with AuctionListRef {
  _AuctionListProviderElement(super.provider);

  @override
  String? get categoryId => (origin as AuctionListProvider).categoryId;
  @override
  String? get search => (origin as AuctionListProvider).search;
}

String _$watchlistActionsHash() => r'e41409a8796715f754f8aebec0d9e76baadf456b';

/// See also [WatchlistActions].
@ProviderFor(WatchlistActions)
final watchlistActionsProvider =
    AutoDisposeAsyncNotifierProvider<WatchlistActions, void>.internal(
      WatchlistActions.new,
      name: r'watchlistActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchlistActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WatchlistActions = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
