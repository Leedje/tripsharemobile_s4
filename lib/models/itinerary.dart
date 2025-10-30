import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/day.dart';

class ItineraryDTO {
  String image = '';
  String id = '';
  String name = '';
  String description = '';
  String country = '';
  String city = '';
  DateTimeRange travelDates = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  List <Day> days = [];
  int numberOfDays = 0;
}
