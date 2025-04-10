import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geolocator/geolocator.dart';

class PermissionService {
  Future<bool> handleLocationPermission() async {
    if (kIsWeb) {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return false;
      }
      
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }
      
      return permission == LocationPermission.always || 
             permission == LocationPermission.whileInUse;
    } else {
      bool serviceEnabled = await Permission.locationWhenInUse.serviceStatus.isEnabled;
      if (!serviceEnabled) {
        return false;
      }

      PermissionStatus permission = await Permission.locationWhenInUse.status;
      if (permission == PermissionStatus.denied) {
        permission = await Permission.locationWhenInUse.request();
        if (permission == PermissionStatus.denied) {
          return false;
        }
      }

      return permission == PermissionStatus.granted;
    }
  }
}