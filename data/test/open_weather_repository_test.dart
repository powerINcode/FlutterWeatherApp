import 'package:core/data/data.dart';
import 'package:data/src/dto/weather_dto/main_dto.dart';
import 'package:data/src/dto/weather_dto/weather_dto.dart';
import 'package:data/src/repositories/openweather_weather_repository.dart';
import 'package:domain/index.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'mocks.dart';

const _appId = '';

void main() {
  late OpenWeatherWeatherRepository repository;
  late MockOpenWeatherService service;

  setUp(() {
    service = MockOpenWeatherService();

    repository = OpenWeatherWeatherRepository(service: service, apiKey: _appId);
  });

  test(
      'GIVEN weather fetching WHEN fetch weather for a city THEN service call getWeather with exact lat and lon and return domain model',
      () async {
    // arrange
    const lat = 1.0;
    const lon = 2.0;
    const dto = WeatherDto(
      id: 1,
      main: MainDto(
        temp: 1,
        feelsLike: 2,
        tempMin: 3,
        tempMax: 4,
        pressure: 5,
        humidity: 6,
      ),
      name: 'name',
    );

    final expected = Data.value(
      value: Weather(
        temp: 1,
        feelsLike: 2,
        tempMin: 3,
        tempMax: 4,
        pressure: 5,
        humidity: 6,
      ),
    );

    when(() => service.getWeather(
        lon: any(named: 'lon'),
        lat: any(named: 'lat'),
        appId: any(named: 'appId'))).thenAnswer((_) => Future.value(dto));

    // act
    final actual = await repository.getWeather(lat: lat, lon: lon);

    // assert
    verify(() => service.getWeather(lat: lat, lon: lon, appId: _appId))
        .called(1);
    expect(actual, expected);
  });
}
