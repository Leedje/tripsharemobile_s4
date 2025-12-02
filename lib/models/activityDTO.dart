import 'package:json_annotation/json_annotation.dart';

part 'activityDTO.g.dart';

@JsonSerializable()
class ActivityDTO {
  String id;
  String name;
  String description;
  String location;
  String link;

  ActivityDTO({
    this.id = '',
    this.name = '',
    this.description = '',
    this.location = '',
    this.link = '',
  });

  factory ActivityDTO.fromJson(Map<String, dynamic> json) =>
      _$ActivityDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityDTOToJson(this);
}
