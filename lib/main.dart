import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/config/router.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (itineraryViewModel) => ItineraryViewModel(),
      child: MaterialApp.router(
        routerConfig: appRouter,
      ),
    );
  }
}
