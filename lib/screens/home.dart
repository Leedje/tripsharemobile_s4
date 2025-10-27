import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';
import 'package:tripsharemobile_s4/widgets/itineraryCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints.tightFor(height: 450),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Color(0xFFD2DBEA),
                borderRadius: BorderRadius.circular(30), //i only want the top corners w the radius and i want the container fixed at the bottom of the page
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column( // somewhere, i need to set the start heights of both the column and the container as the same start height.
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Upcoming Itineraries', style: TextStyle(fontWeight: FontWeight.bold,),), 
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(children: [ItineraryCard(), ItineraryCard()]), //I'm assuming to make each card tapable, i need to iterate trhough all itineraries and wrap each itinerary card in a gesture detector. thst way i can handle routing in the ontap.
                  )),
                  SizedBox(height: 5),
                  Text('Past Itineraries', style: TextStyle(fontWeight: FontWeight.bold),),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(children: [ItineraryCard()],),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
