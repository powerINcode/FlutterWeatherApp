import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddresDto {
  final String cityName;
  final String cityCode;
  final String countryName;
  final String countryCode;
  final String regionCode;

  const AddresDto({
    required this.cityName,
    required this.cityCode,
    required this.countryName,
    required this.countryCode,
    required this.regionCode,
  });

  factory AddresDto.fromJson(Map<String, dynamic> json) {
    return _$AddresDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddresDtoToJson(this);
}
