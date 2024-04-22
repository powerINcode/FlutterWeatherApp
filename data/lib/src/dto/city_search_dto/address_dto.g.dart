// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddresDto _$AddresDtoFromJson(Map<String, dynamic> json) => AddresDto(
      cityName: json['cityName'] as String,
      cityCode: json['cityCode'] as String,
      countryName: json['countryName'] as String,
      countryCode: json['countryCode'] as String,
      regionCode: json['regionCode'] as String,
    );

Map<String, dynamic> _$AddresDtoToJson(AddresDto instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'cityCode': instance.cityCode,
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'regionCode': instance.regionCode,
    };
