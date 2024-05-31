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
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? changenumber(int? name) {
  // code to infintely increase number
  return name! + 1;
}

String? getrandomvalue(List<String>? quotes) {
  // code to get random value from list of strings
  if (quotes == null || quotes.isEmpty) return null;
  final random = math.Random();
  final index = random.nextInt(quotes.length);
  return quotes[index];
}

List<DateTime>? getWeekView(DateTime? currentDate) {
  // define the current week and return a list of date times based on currentDate
  if (currentDate == null) return null;

  final List<DateTime> week = [];

  // Find the first day of the week (Monday)
  final int delta = currentDate.weekday - DateTime.monday;
  final DateTime startOfWeek = currentDate.subtract(Duration(days: delta));

  // Add each day of the week to the list
  for (int i = 0; i < 7; i++) {
    week.add(startOfWeek.add(Duration(days: i)));
  }

  return week;
}

int? getonemorenumber(int? idemindex) {
  // code that makes 0 to 1 bascically add one more number than the given number
  if (idemindex == null) {
    return null;
  } else {
    return idemindex + 1;
  }
}
