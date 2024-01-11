import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _homeAddress = prefs.getString('ff_homeAddress') ?? _homeAddress;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _selectedDateDayMonth = 0;
  int get selectedDateDayMonth => _selectedDateDayMonth;
  set selectedDateDayMonth(int _value) {
    _selectedDateDayMonth = _value;
  }

  String _pickupDateDayMonth = '';
  String get pickupDateDayMonth => _pickupDateDayMonth;
  set pickupDateDayMonth(String _value) {
    _pickupDateDayMonth = _value;
  }

  int _SelectedTimeCard = 0;
  int get SelectedTimeCard => _SelectedTimeCard;
  set SelectedTimeCard(int _value) {
    _SelectedTimeCard = _value;
  }

  String _serviceSelected = '';
  String get serviceSelected => _serviceSelected;
  set serviceSelected(String _value) {
    _serviceSelected = _value;
  }

  List<String> _cartItems = [];
  List<String> get cartItems => _cartItems;
  set cartItems(List<String> _value) {
    _cartItems = _value;
  }

  void addToCartItems(String _value) {
    _cartItems.add(_value);
  }

  void removeFromCartItems(String _value) {
    _cartItems.remove(_value);
  }

  void removeAtIndexFromCartItems(int _index) {
    _cartItems.removeAt(_index);
  }

  void updateCartItemsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _cartItems[_index] = updateFn(_cartItems[_index]);
  }

  void insertAtIndexInCartItems(int _index, String _value) {
    _cartItems.insert(_index, _value);
  }

  String _homeAddress = '';
  String get homeAddress => _homeAddress;
  set homeAddress(String _value) {
    _homeAddress = _value;
    prefs.setString('ff_homeAddress', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
