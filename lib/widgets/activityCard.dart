import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/itinerary.dart';

class ActivityCard extends StatelessWidget{

  final ItineraryDTO itinerary;

  const ActivityCard({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
           // the number comes here

           Column(children: [
            Text('Activity Location/Name', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Activity Description')
           ],)
        ],
       
      ),
    );
  }
}