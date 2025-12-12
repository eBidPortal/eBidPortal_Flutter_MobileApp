import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class LocationState {
  final bool isLoading;
  final String? locationName;
  final Position? position;
  final String? error;
  final bool hasPermission;
  final bool permissionRequested;

  const LocationState({
    this.isLoading = false,
    this.locationName,
    this.position,
    this.error,
    this.hasPermission = false,
    this.permissionRequested = false,
  });

  LocationState copyWith({
    bool? isLoading,
    String? locationName,
    Position? position,
    String? error,
    bool? hasPermission,
    bool? permissionRequested,
  }) {
    return LocationState(
      isLoading: isLoading ?? this.isLoading,
      locationName: locationName ?? this.locationName,
      position: position ?? this.position,
      error: error ?? this.error,
      hasPermission: hasPermission ?? this.hasPermission,
      permissionRequested: permissionRequested ?? this.permissionRequested,
    );
  }
}

class LocationNotifier extends StateNotifier<LocationState> {
  final LocationService _locationService;

  LocationNotifier(this._locationService) : super(const LocationState()) {
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    // Check if permission is already granted
    final hasPermission = await _locationService.checkLocationPermission();

    if (hasPermission) {
      await _getCurrentLocation();
    } else {
      state = state.copyWith(
        isLoading: false,
        locationName: 'Enable Location',
        hasPermission: false,
        permissionRequested: false,
      );
    }
  }

  Future<void> _getCurrentLocation() async {
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
          hasPermission: true,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          locationName: 'Location access denied',
          error: 'Location permission denied',
          hasPermission: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        locationName: 'Unknown Location',
        error: e.toString(),
        hasPermission: false,
      );
    }
  }

  Future<void> requestLocationPermission() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      permissionRequested: true,
    );

    final hasPermission = await _locationService.requestPermission();

    if (hasPermission) {
      await _getCurrentLocation();
    } else {
      state = state.copyWith(
        isLoading: false,
        locationName: 'Location access denied',
        error: 'Location permission denied',
        hasPermission: false,
      );
    }
  }

  Future<void> refreshLocation() async {
    await _getCurrentLocation();
  }

  void updateLocationName(String locationName) {
    state = state.copyWith(locationName: locationName);
  }

  Future<void> openLocationSettings() async {
    await _locationService.openLocationSettings();
  }

  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  List<String> getStatesList() {
    return _locationService.getStatesList();
  }
}

final locationProvider = StateNotifierProvider<LocationNotifier, LocationState>(
  (ref) {
    final locationService = ref.watch(locationServiceProvider);
    return LocationNotifier(locationService);
  },
);
