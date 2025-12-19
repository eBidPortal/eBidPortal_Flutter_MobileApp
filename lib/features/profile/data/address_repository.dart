import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../domain/address.dart';

final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AddressRepository(apiClient);
});

class AddressRepository {
  final ApiClient _apiClient;

  AddressRepository(this._apiClient);

  Future<List<Address>> getAddresses() async {
    try {
      final response = await _apiClient.get(ApiConstants.addresses);

      if (response.data['success'] == true) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Address.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch addresses');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Address> getAddress(String addressId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.addresses}/$addressId');

      if (response.data['success'] == true) {
        return Address.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch address');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Address> createAddress(Map<String, dynamic> addressData) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.addresses,
        data: addressData,
      );

      if (response.data['success'] == true) {
        return Address.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to create address');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Address> updateAddress(String addressId, Map<String, dynamic> addressData) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.addresses}/$addressId',
        data: addressData,
      );

      if (response.data['success'] == true) {
        return Address.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to update address');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<void> deleteAddress(String addressId) async {
    try {
      final response = await _apiClient.delete('${ApiConstants.addresses}/$addressId');

      if (response.data['success'] != true) {
        throw Exception(response.data['message'] ?? 'Failed to delete address');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Address> setDefaultAddress(String addressId) async {
    try {
      final response = await _apiClient.patch('${ApiConstants.addresses}/$addressId/default');

      if (response.data['success'] == true) {
        return Address.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to set default address');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}