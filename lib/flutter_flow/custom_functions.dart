import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? listDateMonthDay(
  String type,
  int listIndex,
) {
  // date as integer list
  var date = DateTime.now();
  if (type == "Date") {
    List<String> dates = List<String>.generate(
        12, (int index) => (date.add(Duration(days: index)).day).toString());
    return dates[listIndex];
  } else if (type == "Month") {
    List<String> months = List<String>.generate(
        12,
        (int index) =>
            DateFormat.LLL().format(date.add(Duration(days: index))));
    return months[listIndex];
  } else if (type == "Day") {
    List<String> months = List<String>.generate(12,
        (int index) => DateFormat.E().format(date.add(Duration(days: index))));
    return months[listIndex];
  }
}

List<int> integerListGenerator(int amount) {
  // generate list of integers
  return List<int>.generate(amount, (int index) => index);
}

String timeGiver(
  int cardNumber,
  String startOrEnd,
) {
  // Add your function code here!
  DateTime time = DateTime.now();
  DateTime selectedTime = DateTime(
      time.year,
      time.month,
      time.day,
      7 + (2 * (cardNumber)),
      time.minute,
      time.second,
      time.millisecond,
      time.microsecond);
  if (startOrEnd == "Start") {
    return DateFormat('h a').format(selectedTime).toLowerCase();
  } else {
    return DateFormat('h a')
        .format(selectedTime.add(const Duration(hours: 2)))
        .toLowerCase();
  }
}

bool timeCardVisiblityCheck(int cardNumber) {
  // Add your function code here!
  DateTime time = DateTime.now();
  DateTime selectedTime = DateTime(
      time.year,
      time.month,
      time.day,
      7 + (2 * (cardNumber)),
      time.minute,
      time.second,
      time.millisecond,
      time.microsecond);
  return time.hour < selectedTime.hour ? true : false;
}

bool? selectedTimeCard(
  int? timeCardNumber,
  int? selectedTimeCardNumber,
) {
  // Add your function code here!
  return timeCardNumber == selectedTimeCardNumber ? true : false;
}
