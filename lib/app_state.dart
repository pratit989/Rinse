import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
  set selectedDateDayMonth(int value) {
    _selectedDateDayMonth = value;
  }

  String _pickupDateDayMonth = '';
  String get pickupDateDayMonth => _pickupDateDayMonth;
  set pickupDateDayMonth(String value) {
    _pickupDateDayMonth = value;
  }

  int _SelectedTimeCard = 0;
  int get SelectedTimeCard => _SelectedTimeCard;
  set SelectedTimeCard(int value) {
    _SelectedTimeCard = value;
  }

  String _serviceSelected = '';
  String get serviceSelected => _serviceSelected;
  set serviceSelected(String value) {
    _serviceSelected = value;
  }

  List<String> _cartItems = [];
  List<String> get cartItems => _cartItems;
  set cartItems(List<String> value) {
    _cartItems = value;
  }

  void addToCartItems(String value) {
    _cartItems.add(value);
  }

  void removeFromCartItems(String value) {
    _cartItems.remove(value);
  }

  void removeAtIndexFromCartItems(int index) {
    _cartItems.removeAt(index);
  }

  void updateCartItemsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _cartItems[index] = updateFn(_cartItems[index]);
  }

  void insertAtIndexInCartItems(int index, String value) {
    _cartItems.insert(index, value);
  }

  String _homeAddress = '';
  String get homeAddress => _homeAddress;
  set homeAddress(String value) {
    _homeAddress = value;
    prefs.setString('ff_homeAddress', value);
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
