import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationService {
  Future<bool> requestPermission() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return false;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        print('Location permission is denied. Requesting permission...');
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          print('Location permission denied by user.');
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print('Location permission permanently denied. Opening settings...');
        // Optionally open app settings
        await Geolocator.openAppSettings();
        return false;
      }

      print('Location permission granted: $permission');
      return true;
    } catch (e) {
      print('Error requesting location permission: $e');
      return false;
    }
  }

  Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await requestPermission();
      if (!hasPermission) return null;

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 15),
      );
    } catch (e) {
      print('Error getting current position: $e');
      return null;
    }
  }

  Future<bool> checkLocationPermission() async {
    try {
      final permission = await Geolocator.checkPermission();
      return permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse;
    } catch (e) {
      print('Error checking location permission: $e');
      return false;
    }
  }

  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  Future<String> getLocationName(double latitude, double longitude) async {
    try {
      print('Getting location name for: $latitude, $longitude');

      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        // Build location string with available information
        List<String> locationParts = [];

        if (place.locality != null && place.locality!.isNotEmpty) {
          locationParts.add(place.locality!);
        }

        if (place.administrativeArea != null &&
            place.administrativeArea!.isNotEmpty) {
          locationParts.add(place.administrativeArea!);
        }

        if (place.country != null && place.country!.isNotEmpty) {
          locationParts.add(place.country!);
        }

        String locationName = locationParts.isNotEmpty
            ? locationParts.join(', ')
            : 'Current Location';

        print('Location name resolved to: $locationName');
        return locationName;
      }

      // Fallback to coordinates if geocoding fails
      return '${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}';
    } catch (e) {
      print('Error getting location name: $e');
      // Return coordinates as fallback
      return '${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}';
    }
  }

  List<String> getStatesList() {
    // Indian states list
    return [
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',
      'Bihar',
      'Chhattisgarh',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Madhya Pradesh',
      'Maharashtra',
      'Manipur',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttar Pradesh',
      'Uttarakhand',
      'West Bengal',
      'Delhi',
      'Jammu and Kashmir',
      'Ladakh',
      'Puducherry',
      'Chandigarh',
      'Andaman and Nicobar Islands',
      'Dadra and Nagar Haveli and Daman and Diu',
      'Lakshadweep',
    ];
  }
}

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});
