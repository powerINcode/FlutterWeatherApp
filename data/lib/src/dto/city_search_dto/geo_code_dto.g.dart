// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoCodeDto _$GeoCodeDtoFromJson(Map<String, dynamic> json) => GeoCodeDto(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoCodeDtoToJson(GeoCodeDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
