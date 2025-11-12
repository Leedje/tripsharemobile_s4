import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/day.dart';

class ItineraryDTO {
  String image = '';
  String id = 'apple';
  String name = '';
  String description = '';
  String country = '';
  String city = '';
  DateTimeRange travelDates = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  List <DayDTO> days = [];
  int numberOfDays = 0;
}
