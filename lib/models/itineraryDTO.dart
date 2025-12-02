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
  int numberOfDays;
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
    this.numberOfDays = 0,
    List<DayDTO>? days,
  }) : startDate = startDate ?? DateTime.now(),
       endDate = endDate ?? DateTime.now(),
       days = days ?? [];

  factory ItineraryDTO.fromJson(Map<String, dynamic> json) =>
      _$ItineraryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryDTOToJson(this);
}
