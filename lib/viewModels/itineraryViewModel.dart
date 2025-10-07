import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/itinerary.dart';

class ItineraryViewModel extends ChangeNotifier{
  final List<ItineraryDTO> _itineraries = [];
  List<ItineraryDTO> get itineraries  => _itineraries;

  void initializeData(){
    // this would be my get all if i had a db
  }

  void createItinerary(ItineraryDTO itinerary){
      _itineraries.add(itinerary);

      notifyListeners();
  }

  ItineraryDTO getItineraryById(String id){
    return _itineraries.firstWhere((i) => i.id == id);
  }

  List<ItineraryDTO> searchBy(String keyword){
    if(keyword.isEmpty){
      return _itineraries;
    }
    return _itineraries.where((i) => i.name.contains(keyword)).toList();
  }

}