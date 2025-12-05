import 'package:tripsharemobile_s4/api/apiClient.dart';
import 'package:tripsharemobile_s4/models/itineraryDTO.dart';

class ItineraryService {

  final ApiClient _client = ApiClient();

  Future<List<ItineraryDTO>?> getAllItineraries() async {
    final itineraries = await _client.get('/itinerary');
    return (itineraries as List).map(
      (itinerary) => ItineraryDTO.fromJson(itinerary)
    ).toList();
  }

  Future<ItineraryDTO?> createItinerary(ItineraryDTO itinerary) async{
    final data = await _client.post('/itinerary', itinerary.toJson());
    return ItineraryDTO.fromJson(data);
  }
}
