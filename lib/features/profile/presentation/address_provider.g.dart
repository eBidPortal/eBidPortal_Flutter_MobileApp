// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressDetailHash() => r'b3622a140d4a8c8d79f4c3ab98b2c140568d1caf';

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

/// See also [addressDetail].
@ProviderFor(addressDetail)
const addressDetailProvider = AddressDetailFamily();

/// See also [addressDetail].
class AddressDetailFamily extends Family<AsyncValue<Address>> {
  /// See also [addressDetail].
  const AddressDetailFamily();

  /// See also [addressDetail].
  AddressDetailProvider call(String addressId) {
    return AddressDetailProvider(addressId);
  }

  @override
  AddressDetailProvider getProviderOverride(
    covariant AddressDetailProvider provider,
  ) {
    return call(provider.addressId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addressDetailProvider';
}

/// See also [addressDetail].
class AddressDetailProvider extends AutoDisposeFutureProvider<Address> {
  /// See also [addressDetail].
  AddressDetailProvider(String addressId)
    : this._internal(
        (ref) => addressDetail(ref as AddressDetailRef, addressId),
        from: addressDetailProvider,
        name: r'addressDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$addressDetailHash,
        dependencies: AddressDetailFamily._dependencies,
        allTransitiveDependencies:
            AddressDetailFamily._allTransitiveDependencies,
        addressId: addressId,
      );

  AddressDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.addressId,
  }) : super.internal();

  final String addressId;

  @override
  Override overrideWith(
    FutureOr<Address> Function(AddressDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddressDetailProvider._internal(
        (ref) => create(ref as AddressDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        addressId: addressId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Address> createElement() {
    return _AddressDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddressDetailProvider && other.addressId == addressId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, addressId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddressDetailRef on AutoDisposeFutureProviderRef<Address> {
  /// The parameter `addressId` of this provider.
  String get addressId;
}

class _AddressDetailProviderElement
    extends AutoDisposeFutureProviderElement<Address>
    with AddressDetailRef {
  _AddressDetailProviderElement(super.provider);

  @override
  String get addressId => (origin as AddressDetailProvider).addressId;
}

String _$addressListHash() => r'7ecf5eb8aec65b3da965c3d88c87d0cf12ce8cf4';

/// See also [AddressList].
@ProviderFor(AddressList)
final addressListProvider =
    AutoDisposeAsyncNotifierProvider<AddressList, List<Address>>.internal(
      AddressList.new,
      name: r'addressListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$addressListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AddressList = AutoDisposeAsyncNotifier<List<Address>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
