import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/itinerary.dart';

class ItineraryViewModel extends ChangeNotifier{
  final List<ItineraryDTO> _itineraries = [];
  List<ItineraryDTO> get itineraries  => _itineraries;

  List<ItineraryDTO> getAllItineraries() {
    final now = DateTime.now();

    return [
      // Past itineraries
      ItineraryDTO()
        ..id = 'past1'
        ..name = 'Paris Getaway'
        ..description = 'A romantic escape to the city of lights.'
        ..country = 'France'
        ..city = 'Paris'
        ..travelDates = DateTimeRange(
          start: now.subtract(Duration(days: 10)),
          end: now.subtract(Duration(days: 5)),
        ),

      ItineraryDTO()
        ..id = 'past2'
        ..name = 'Berlin History Tour'
        ..description = 'Explore the rich history of Berlin.'
        ..country = 'Germany'
        ..city = 'Berlin'
        ..travelDates = DateTimeRange(
          start: now.subtract(Duration(days: 20)),
          end: now.subtract(Duration(days: 15)),
        ),

      // Future itineraries
      ItineraryDTO()
        ..id = 'future1'
        ..name = 'Tokyo Adventure'
        ..description = 'Dive into the vibrant culture of Tokyo.'
        ..country = 'Japan'
        ..city = 'Tokyo'
        ..travelDates = DateTimeRange(
          start: now.add(Duration(days: 10)),
          end: now.add(Duration(days: 15)),
        ),

      ItineraryDTO()
        ..id = 'future2'
        ..name = 'Sydney Surf Trip'
        ..description = 'Catch waves and sunshine in Sydney.'
        ..country = 'Australia'
        ..city = 'Sydney'
        ..travelDates = DateTimeRange(
          start: now.add(Duration(days: 20)),
          end: now.add(Duration(days: 25)),
        ),

      ItineraryDTO()
        ..id = 'future3'
        ..name = 'New York City Break'
        ..description = 'Experience the buzz of NYC.'
        ..country = 'USA'
        ..city = 'New York'
        ..travelDates = DateTimeRange(
          start: now.add(Duration(days: 30)),
          end: now.add(Duration(days: 35)),
        ),

      ItineraryDTO()
        ..id = 'future4'
        ..name = 'Cape Town Safari'
        ..description = 'Wildlife and landscapes in South Africa.'
        ..country = 'South Africa'
        ..city = 'Cape Town'
        ..travelDates = DateTimeRange(
          start: now.add(Duration(days: 40)),
          end: now.add(Duration(days: 45)),
        ),
    ];
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