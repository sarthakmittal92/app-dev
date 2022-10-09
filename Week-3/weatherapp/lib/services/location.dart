import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

class Fetcher {
  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? locationData;
  String? city;
  Future <void> fetchLocation () async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    locationData = await location.getLocation();
    final coordinates = new Coordinates(
        locationData?.latitude, locationData?.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    city = first.locality;
  }
}