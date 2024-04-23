import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';

@freezed
class City with _$City {
  factory City({
    required String cityName,
    required String cityCode,
    required String countryName,
    required String countryCode,
    required String regionCode,
    required double lat,
    required double lon,
  }) = _City;
}
