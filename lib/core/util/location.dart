import 'package:location/location.dart';

class LocationUtil {
  static Future<Map<String, String>> getCurrentLoc() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return {};
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return {};
      }
    }

    _locationData = await location.getLocation();

    return {
      'lat': _locationData.latitude.toString(),
      'lon': _locationData.longitude.toString(),
    };
  }
}