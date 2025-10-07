import 'package:tripsharemobile_s4/models/day.dart';

class ItineraryDTO {
  String image = '';
  String id = '';
  String name = '';
  String description = '';
  String country = '';
  String city = '';
  DateTime departure = DateTime.now();
  DateTime arrival = DateTime.now();
  List <Day> days = [];
  int numberOfDays = 0;
}
