// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$auctionListHash() => r'9dfacbfcc0679a7cc327098e49cd3081ed1ca871';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
