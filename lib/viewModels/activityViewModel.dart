import 'package:flutter/widgets.dart';
import 'package:tripsharemobile_s4/models/activityDTO.dart';
import 'package:tripsharemobile_s4/services/activityService.dart';

class ActivityViewModel extends ChangeNotifier{

  final ActivityService activityService = ActivityService();

  //I believe somewhere here needs to locally manage the state of the activities per day, so when a new one is added the UI updates.

   void addActivity(ActivityDTO activity){
    activityService.addActivity(activity);
  }  
}