import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/activity.dart';
import 'package:tripsharemobile_s4/models/day.dart';
import 'package:tripsharemobile_s4/models/itinerary.dart';

class ActivityCard extends StatelessWidget{

  final ActivityDTO activity; //i need to make sure the correct number activity is showed because the ID is a Guid

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
           CircleAvatar(child: Text('Activity index + 1'),),

           Column(children: [
            Text('Activity Location/Name', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Activity Description')
           ],)
        ],
       
      ),
    );
  }
}