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
        child: CustomScrollView(
          slivers: [
            Container(
              constraints: BoxConstraints.tightFor(height: 450),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Color(0xFFD2DBEA),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Upcoming Itineraries', style: TextStyle(fontWeight: FontWeight.bold,),), 
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(children: [ItineraryCard(), ItineraryCard()]), //wrap each itinerary card in a gesture detector. thst way i can handle routing in the ontap.
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
