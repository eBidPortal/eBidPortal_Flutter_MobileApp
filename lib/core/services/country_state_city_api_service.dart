import 'package:dio/dio.dart';

class CountryStateCityApiService {
  final Dio _dio;
  final String baseUrl;

  CountryStateCityApiService({Dio? dio, this.baseUrl = 'https://api.ebidportal.com/api/v1'})
      : _dio = dio ?? Dio();

  Future<List<Map<String, dynamic>>> fetchCountries({String? search}) async {
    final queryParameters = <String, dynamic>{'limit': 250};
    if (search != null) queryParameters['search'] = search;
    final response = await _dio.get('$baseUrl/locations/countries', queryParameters: queryParameters);
    final data = response.data['data'];
    if (data is Map && data.containsKey('countries')) {
      final countries = data['countries'];
      if (countries is List) {
        return countries.cast<Map<String, dynamic>>();
      }
    }
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    } else if (data is Map) {
      return [data.cast<String, dynamic>()];
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchStates(String countryId, {String? search}) async {
    final response = await _dio.get('$baseUrl/locations/countries/$countryId/states', queryParameters: search != null ? {'search': search} : null);
    final data = response.data['data'];
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    } else if (data is Map) {
      return [data.cast<String, dynamic>()];
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchCities(String stateId, {String? search}) async {
    final response = await _dio.get('$baseUrl/locations/states/$stateId/cities', queryParameters: search != null ? {'search': search} : null);
    final data = response.data['data'];
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    } else if (data is Map) {
      return [data.cast<String, dynamic>()];
    } else {
      return [];
    }
  }
}
