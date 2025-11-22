import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/activity.dart';
import 'package:tripsharemobile_s4/models/day.dart';
import 'package:tripsharemobile_s4/models/itinerary.dart';

class ActivityCard extends StatelessWidget{

  final ActivityDTO activity; 
  final activityNumber;

  const ActivityCard({super.key, required this.activity, required this.activityNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
           CircleAvatar(child: Text(activityNumber),),

           Column(children: [
            Text('Activity Location/Name', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Activity Description')
           ],)
        ],
       
      ),
    );
  }
}