import 'package:flutter/widgets.dart';
import 'package:tripsharemobile_s4/models/activityDTO.dart';
import 'package:tripsharemobile_s4/services/activityService.dart';

class ActivityViewModel extends ChangeNotifier{

 final ActivityService activityService;

 ActivityViewModel(this.activityService);

   Future<bool> addActivity(ActivityDTO activity) async{
    final response = await activityService.addActivity(activity);
    notifyListeners();
    return response;
  }  
}