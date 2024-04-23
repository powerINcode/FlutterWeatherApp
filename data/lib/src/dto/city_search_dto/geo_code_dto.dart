import 'package:json_annotation/json_annotation.dart';

part 'geo_code_dto.g.dart';

@JsonSerializable()
class GeoCodeDto {
  final double latitude;
  final double longitude;

  const GeoCodeDto({
    required this.latitude,
    required this.longitude,
  });

  factory GeoCodeDto.fromJson(Map<String, dynamic> json) {
    return _$GeoCodeDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeoCodeDtoToJson(this);
}
