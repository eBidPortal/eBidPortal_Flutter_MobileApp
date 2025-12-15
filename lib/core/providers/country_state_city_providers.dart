import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/country_state_city_api_service.dart';

final countryStateCityApiServiceProvider = Provider<CountryStateCityApiService>((ref) {
  return CountryStateCityApiService();
});

final countriesProvider = FutureProvider.autoDispose.family<List<Map<String, dynamic>>, String?>(
  (ref, search) async {
    final api = ref.watch(countryStateCityApiServiceProvider);
    return api.fetchCountries(search: search);
  },
);

final statesProvider = FutureProvider.autoDispose.family<List<Map<String, dynamic>>, Map<String, String?>>(
  (ref, params) async {
    final api = ref.watch(countryStateCityApiServiceProvider);
    final countryId = params['countryId'];
    final search = params['search'];
    if (countryId == null) return [];
    return api.fetchStates(countryId, search: search);
  },
);

final citiesProvider = FutureProvider.autoDispose.family<List<Map<String, dynamic>>, Map<String, String?>>(
  (ref, params) async {
    final api = ref.watch(countryStateCityApiServiceProvider);
    final stateId = params['stateId'];
    final search = params['search'];
    if (stateId == null) return [];
    return api.fetchCities(stateId, search: search);
  },
);
