import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/day.dart';
import 'package:tripsharemobile_s4/widgets/activityCard.dart';

class ActivitiesTab extends StatelessWidget{
  final List<DayDTO> days;

  const ActivitiesTab({super.key, required this.days});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      // for each activity build a card
      // make sure each acitivity matches the day
      //final activities = days[index].activities;
      
      // return ActivityCard(activity: activities.first);
    });
  }
}