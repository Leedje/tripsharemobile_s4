import 'package:tripsharemobile_s4/models/activity.dart';

class DayDTO {
  String id = '';
  String name = '';
  String itineraryId = '';
  DateTime date = DateTime.now();
  List<ActivityDTO> activities = [];
}