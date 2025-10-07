import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itineraryViewModel = context.watch<ItineraryViewModel>();

    return Scaffold(
      body: Column(
        children: [
          Text('Upcoming Itineraries'),
          Container(child: ListView(children: [Card(), Card()])),
          SizedBox(height: 5),
          Text('Past Itineraries'),
          Container(child: ListView()),
        ],
      ),
    );
  }
}
