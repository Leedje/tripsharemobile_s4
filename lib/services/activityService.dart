import 'package:tripsharemobile_s4/api/apiClient.dart';
import 'package:tripsharemobile_s4/models/activityDTO.dart';

class ActivityService{

  final ApiClient _client = ApiClient();

Future<bool> addActivity(ActivityDTO activity) async{
  print(activity.toJson());
  return await _client.post('/activity', activity.toJson());
}

}