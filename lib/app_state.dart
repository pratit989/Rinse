import 'package:rinse/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../flutter_flow/custom_functions.dart' as functions;

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
    _officeAddress = prefs.getString('ff_officeAddress') ?? _officeAddress;
    _otherAddress = prefs.getString('ff_otherAddress') ?? _otherAddress;
  }

  SharedPreferences prefs;

  Map<String, int> monthToIntMapper = {
    'Jan' : 1,
    'Feb' : 2,
    'Mar' : 3,
    'Apr' : 4,
    'May' : 5,
    'Jun' : 7,
    'Jul' : 8,
    'Sep' : 9,
    'Oct' : 10,
    'Nov' : 11,
    'Dec' : 12
  };

  int selectedDateDayMonth = 0;

  DateTime pickupDateDayMonth = DateTime.now();

  String selectedTimeCard = '';

  String serviceSelected = '';

  String deliveryAddress = '';

  Map<int, List<dynamic>> cleaningPressingCartItems = {};

  Map<int, List<dynamic>> pressingCartItems = {};

  String _homeAddress = ' |  |  | ';
  String _officeAddress = ' |  |  | ';
  String _otherAddress = ' |  |  | ';

  String get homeAddress => _homeAddress;
  String get officeAddress => _officeAddress;
  String get otherAddress => _otherAddress;

  set homeAddress(String _value) {
    _homeAddress = _value;
    prefs.setString('ff_homeAddress', _value);
  }

  set officeAddress(String _value) {
    _officeAddress = _value;
    prefs.setString('ff_officeAddress', _value);
  }

  set otherAddress(String _value) {
    _otherAddress = _value;
    prefs.setString('ff_otherAddress', _value);
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
