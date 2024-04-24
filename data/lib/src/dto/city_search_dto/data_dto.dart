import 'package:data/src/dto/city_search_dto/address_dto.dart';
import 'package:data/src/dto/city_search_dto/geo_code_dto.dart';
import 'package:domain/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  final String id;
  final String type;
  final String subType;
  final String name;
  final String detailedName;
  final String timeZoneOffset;
  final String iataCode;
  final AddresDto address;
  final GeoCodeDto geoCode;

  const DataDto({
    required this.id,
    required this.type,
    required this.subType,
    required this.name,
    required this.detailedName,
    required this.timeZoneOffset,
    required this.iataCode,
    required this.address,
    required this.geoCode,
  });

  factory DataDto.fromJson(Map<String, dynamic> json) =>
      _$DataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataDtoToJson(this);
}

extension DataDtoX on DataDto {
  City toDomain() => City(
        cityName: address.cityName,
        cityCode: address.cityCode,
        countryName: address.countryName,
        countryCode: address.countryCode,
        regionCode: address.regionCode,
        lon: geoCode.longitude,
        lat: geoCode.latitude,
      );
}
