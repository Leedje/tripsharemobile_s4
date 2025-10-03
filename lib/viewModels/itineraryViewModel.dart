import 'package:flutter/material.dart';

class ItineraryViewModel extends ChangeNotifier{
  final List<String> _itineraries = List.empty();
  List<String> get itineraries  => _itineraries;

  void initializeData(){
    
  }
}