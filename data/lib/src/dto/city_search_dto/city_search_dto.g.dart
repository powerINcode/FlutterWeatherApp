// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitySearchDto _$CitySearchDtoFromJson(Map<String, dynamic> json) =>
    CitySearchDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitySearchDtoToJson(CitySearchDto instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
