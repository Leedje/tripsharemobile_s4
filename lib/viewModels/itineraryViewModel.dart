import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/itineraryDTO.dart';
import 'package:tripsharemobile_s4/services/itineraryService.dart';

class ItineraryViewModel extends ChangeNotifier {
  final ItineraryService itineraryService;
  ItineraryViewModel(this.itineraryService);

  final List<ItineraryDTO> _itineraries = [];
  List<ItineraryDTO> get itineraries => _itineraries;

  ItineraryDTO _createdItinerary = ItineraryDTO();
  ItineraryDTO get createdItinerary => _createdItinerary;

  List<ItineraryDTO> getAllItineraries() {
    return _itineraries;
  }

  Future<void> createItinerary(ItineraryDTO itinerary) async {
    _createdItinerary =
        await itineraryService.createItinerary(itinerary) as ItineraryDTO;
    notifyListeners();
  }

  ItineraryDTO getItineraryById(String id) {
    return _itineraries.firstWhere((i) => i.id == id);
  }

  List<ItineraryDTO> searchBy(String keyword) {
    return keyword.isEmpty
        ? _itineraries
        : _itineraries
              .where(
                (itinerary) => itinerary.name.toLowerCase().contains(
                  keyword.toLowerCase(),
                ),
              )
              .toList();
  }
}
