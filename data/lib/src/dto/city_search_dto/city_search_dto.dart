import 'package:data/src/dto/city_search_dto/data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_search_dto.g.dart';

@JsonSerializable()
class CitySearchDto {
  final List<DataDto> data;

  const CitySearchDto({
    required this.data,
  });

  factory CitySearchDto.fromJson(Map<String, dynamic> json) {
    return _$CitySearchDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CitySearchDtoToJson(this);
}
