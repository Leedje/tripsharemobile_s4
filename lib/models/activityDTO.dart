import 'package:json_annotation/json_annotation.dart';

part 'activityDTO.g.dart';

@JsonSerializable()
class ActivityDTO {
  String id;
  String name;
  String description;
  String location;
  String link;
  String dayId;

  ActivityDTO({
    this.id = '',
    this.name = '',
    this.description = '',
    this.location = '',
    this.link = '',
    this.dayId = '',
  });

  factory ActivityDTO.fromJson(Map<String, dynamic> json) =>
      _$ActivityDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final map = _$ActivityDTOToJson(this);

    if (map['id'] == '') {
      map.remove('id');
    }

    return map;
  }
}
