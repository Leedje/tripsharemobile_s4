// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itineraryDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryDTO _$ItineraryDTOFromJson(Map<String, dynamic> json) => ItineraryDTO(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  country: json['country'] as String? ?? '',
  city: json['city'] as String? ?? '',
  image: json['image'] as String? ?? '',
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  numberOfDays: (json['numberOfDays'] as num?)?.toInt() ?? 0,
  days: (json['days'] as List<dynamic>?)
      ?.map((e) => DayDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ItineraryDTOToJson(ItineraryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'country': instance.country,
      'city': instance.city,
      'image': instance.image,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'numberOfDays': instance.numberOfDays,
      'days': instance.days.map((e) => e.toJson()).toList(),
    };
