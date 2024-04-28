import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class LocationServices {
  static getCurrrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        getCurrrentLocation();
      }
    }

    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    log(currentPosition.toString());

    return currentPosition;
  }
}
