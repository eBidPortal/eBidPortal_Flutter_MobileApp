import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/address_repository.dart';
import '../domain/address.dart';

part 'address_provider.g.dart';

@riverpod
class AddressList extends _$AddressList {
  @override
  FutureOr<List<Address>> build() async {
    final repository = ref.watch(addressRepositoryProvider);
    return repository.getAddresses();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(addressRepositoryProvider);
      return repository.getAddresses();
    });
  }

  Future<void> addAddress(Map<String, dynamic> addressData) async {
    try {
      final repository = ref.read(addressRepositoryProvider);
      final newAddress = await repository.createAddress(addressData);
      
      // Refresh the list
      await refresh();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAddress(String addressId, Map<String, dynamic> addressData) async {
    try {
      final repository = ref.read(addressRepositoryProvider);
      await repository.updateAddress(addressId, addressData);
      
      // Refresh the list
      await refresh();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAddress(String addressId) async {
    try {
      final repository = ref.read(addressRepositoryProvider);
      await repository.deleteAddress(addressId);
      
      // Refresh the list
      await refresh();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setDefaultAddress(String addressId) async {
    try {
      final repository = ref.read(addressRepositoryProvider);
      await repository.setDefaultAddress(addressId);
      
      // Refresh the list
      await refresh();
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
Future<Address> addressDetail(ref, String addressId) async {
  final repository = ref.watch(addressRepositoryProvider);
  return repository.getAddress(addressId);
}