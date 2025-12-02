import 'package:json_annotation/json_annotation.dart';
import 'package:tripsharemobile_s4/models/activityDTO.dart';

part 'dayDTO.g.dart';

@JsonSerializable(explicitToJson: true)
class DayDTO {
  String id;
  String name;
  String itineraryId;
  DateTime date;
  List<ActivityDTO> activities;

  DayDTO({
    this.id = '',
    this.name = '',
    this.itineraryId = '',
    DateTime? date,
    List<ActivityDTO>? activities,
  }) : date = date ?? DateTime.now(),
       activities = activities ?? [];

  factory DayDTO.fromJson(Map<String, dynamic> json) => _$DayDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DayDTOToJson(this);
}
