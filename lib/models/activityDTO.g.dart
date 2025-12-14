// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activityDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityDTO _$ActivityDTOFromJson(Map<String, dynamic> json) => ActivityDTO(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  location: json['location'] as String? ?? '',
  link: json['link'] as String? ?? '',
  dayId: json['dayId'] as String? ?? '',
);

Map<String, dynamic> _$ActivityDTOToJson(ActivityDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'link': instance.link,
      'dayId': instance.dayId,
    };
