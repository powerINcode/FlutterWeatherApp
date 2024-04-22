import 'package:json_annotation/json_annotation.dart';

import 'main_dto.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDto {
  final int id;
  final MainDto main;
  final String name;

  const WeatherDto({
    required this.id,
    required this.main,
    required this.name,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return _$WeatherDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}
