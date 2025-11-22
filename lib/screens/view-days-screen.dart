import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';

class ViewDaysScreen extends StatefulWidget {
  @override
  State<ViewDaysScreen> createState() => _ViewDaysScreenState();
}

class _ViewDaysScreenState extends State<ViewDaysScreen> {
  @override
  Widget build(BuildContext context) {
    final itinerary = context.watch<ItineraryViewModel>().createdItinerary;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Plan Your Itinerary',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(height: 20),
      
            /// Days List
            ...itinerary.days.map( (day) => 
            GestureDetector(
              onTap: () {
                context.push('/day/${day.id}');
              },
              child: ListTile(
                title: Text(day.name), //this needs a formatter
              ),
            ),
            ),

            SizedBox(height: 25),

            FilledButton(onPressed: () {

            }, child: Text('Complete'))
          ],
        ),
      ),
    );
  }
}
