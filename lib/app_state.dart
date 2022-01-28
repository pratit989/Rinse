import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _homeAddress = prefs.getString('ff_homeAddress') ?? _homeAddress;
  }

  SharedPreferences prefs;

  int selectedDateDayMonth = 0;

  String pickupDateDayMonth = '';

  int SelectedTimeCard = 0;

  String serviceSelected = '';

  List<String> cartItems = [];

  String _homeAddress = '';
  String get homeAddress => _homeAddress;
  set homeAddress(String _value) {
    _homeAddress = _value;
    prefs.setString('ff_homeAddress', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
