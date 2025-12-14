import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/itineraryDTO.dart';
import 'package:tripsharemobile_s4/services/itineraryService.dart';

class ItineraryViewModel extends ChangeNotifier {
  final ItineraryService itineraryService;
  ItineraryViewModel(this.itineraryService);

  List<ItineraryDTO> _itineraries = [];
  List<ItineraryDTO> get itineraries => _itineraries;

  ItineraryDTO _createdItinerary = ItineraryDTO();
  ItineraryDTO get createdItinerary => _createdItinerary;

  ItineraryDTO? _itineraryByID = ItineraryDTO();
  ItineraryDTO? get itineraryByID => _itineraryByID;

  Future<void> getAllItineraries() async {
    _itineraries = await itineraryService.getAllItineraries();
    notifyListeners();
  }

  Future<ItineraryDTO> createItinerary(ItineraryDTO itinerary) async {
    _createdItinerary =
        await itineraryService.createItinerary(itinerary) as ItineraryDTO;
    notifyListeners();
    return _createdItinerary;
  }

  Future<void> getItineraryById(String id) async {
    final result = await itineraryService.getItineraryById(id);
    if (_itineraryByID != null) {
      _itineraryByID = result;
    } else {
      _itineraryByID = ItineraryDTO();
    }
    notifyListeners();
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
