import 'package:json_annotation/json_annotation.dart';
import 'package:tripsharemobile_s4/models/dayDTO.dart';

part 'itineraryDTO.g.dart';

@JsonSerializable(explicitToJson: true)
class ItineraryDTO {
  String id;
  String name;
  String description;
  String country;
  String city;
  String image;
  DateTime startDate;
  DateTime endDate;
  List<DayDTO> days;

  ItineraryDTO({
    this.id = '',
    this.name = '',
    this.description = '',
    this.country = '',
    this.city = '',
    this.image = '',
    DateTime? startDate,
    DateTime? endDate,
    List<DayDTO>? days,
  }) : startDate = startDate ?? DateTime.now(),
       endDate = endDate ?? DateTime.now(),
       days = days ?? [];

  factory ItineraryDTO.fromJson(Map<String, dynamic> json) =>
      _$ItineraryDTOFromJson(json);

   @override
  Map<String, dynamic> toJson() {
    final map = _$ItineraryDTOToJson(this);

    if (map['id'] == '') {
      map.remove('id');
    }

    return map;
  }

}
