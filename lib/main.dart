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
        theme: ThemeData(

          fontFamily: 'Poppins',
          // ElevatedButton default style
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              textStyle: const TextStyle(
                color: Color(0xFF18C0C1),
                fontFamily: 'Poppins',
              ),
            ),
          ),

          // FilledButton default style
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF18C0C1),
              foregroundColor: Colors.white, 
              textStyle: const TextStyle(fontFamily: 'Poppins'),
            ),
          ),
        ),
      ),
    );
  }
}
