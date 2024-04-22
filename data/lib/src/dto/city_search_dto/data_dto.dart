import 'package:data/src/dto/city_search_dto/address_dto.dart';
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

  const DataDto({
    required this.id,
    required this.type,
    required this.subType,
    required this.name,
    required this.detailedName,
    required this.timeZoneOffset,
    required this.iataCode,
    required this.address,
  });

  factory DataDto.fromJson(Map<String, dynamic> json) => _$DataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataDtoToJson(this);
}
