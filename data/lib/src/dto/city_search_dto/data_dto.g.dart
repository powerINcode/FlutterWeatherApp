// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
      id: json['id'] as String,
      type: json['type'] as String,
      subType: json['subType'] as String,
      name: json['name'] as String,
      detailedName: json['detailedName'] as String,
      timeZoneOffset: json['timeZoneOffset'] as String,
      iataCode: json['iataCode'] as String,
      address: AddresDto.fromJson(json['address'] as Map<String, dynamic>),
      geoCode: GeoCodeDto.fromJson(json['geoCode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataDtoToJson(DataDto instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'subType': instance.subType,
      'name': instance.name,
      'detailedName': instance.detailedName,
      'timeZoneOffset': instance.timeZoneOffset,
      'iataCode': instance.iataCode,
      'address': instance.address,
      'geoCode': instance.geoCode,
    };
