// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dayDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayDTO _$DayDTOFromJson(Map<String, dynamic> json) => DayDTO(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  itineraryId: json['itineraryId'] as String? ?? '',
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  activities: (json['activities'] as List<dynamic>?)
      ?.map((e) => ActivityDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DayDTOToJson(DayDTO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'itineraryId': instance.itineraryId,
  'date': instance.date.toIso8601String(),
  'activities': instance.activities.map((e) => e.toJson()).toList(),
};
