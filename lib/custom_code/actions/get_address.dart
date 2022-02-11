// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:geocoding/geocoding.dart';

Future getAddress(LatLng location) async {
  // Add your function code here!
  List<Placemark> newPlace =
      await placemarkFromCoordinates(location.latitude, location.longitude);

  Placemark placeMark = newPlace[0];
  String name = placeMark.name;
  String subLocality = placeMark.subLocality;
  String locality = placeMark.locality;
  String administrativeArea = placeMark.administrativeArea;
  String postalCode = placeMark.postalCode;
  String country = placeMark.country;
  String address =
      "$name, | $locality, | $administrativeArea | $postalCode";

  return address;
}
