import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class LocationState {
  final bool isLoading;
  final String? locationName;
  final Position? position;
  final String? error;

  const LocationState({
    this.isLoading = false,
    this.locationName,
    this.position,
    this.error,
  });

  LocationState copyWith({
    bool? isLoading,
    String? locationName,
    Position? position,
    String? error,
  }) {
    return LocationState(
      isLoading: isLoading ?? this.isLoading,
      locationName: locationName ?? this.locationName,
      position: position ?? this.position,
      error: error ?? this.error,
    );
  }
}

class LocationNotifier extends StateNotifier<LocationState> {
  final LocationService _locationService;

  LocationNotifier(this._locationService) : super(const LocationState()) {
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final position = await _locationService.getCurrentPosition();
      if (position != null) {
        final locationName = await _locationService.getLocationName(
          position.latitude,
          position.longitude,
        );
        state = state.copyWith(
          isLoading: false,
          locationName: locationName,
          position: position,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          locationName: 'Location access denied',
          error: 'Location permission denied',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        locationName: 'Unknown Location',
        error: e.toString(),
      );
    }
  }

  Future<void> refreshLocation() async {
    await _initializeLocation();
  }

  void updateLocationName(String locationName) {
    state = state.copyWith(locationName: locationName);
  }

  List<String> getStatesList() {
    return _locationService.getStatesList();
  }
}

final locationProvider = StateNotifierProvider<LocationNotifier, LocationState>((ref) {
  final locationService = ref.watch(locationServiceProvider);
  return LocationNotifier(locationService);
});