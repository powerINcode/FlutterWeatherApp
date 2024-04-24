import 'package:core/data/data.dart';
import 'package:domain/index.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  late WeatherInteractorImpl interactor;

  late CityRepository cityRepository;
  late WeatherRepository weatherRepository;

  setUp(() {
    cityRepository = MockCityRepository();
    weatherRepository = MockWeatherRepository();

    interactor = WeatherInteractorImpl(
      cityRepository: cityRepository,
      weatherRepository: weatherRepository,
    );
  });

  test(
      'GIVEN cities are being searched WHEN a search query is applied, THEN the repository is invoked to search with the precise query and provide a list of cities.',
      () async {
    // arrange
    const query = 'Paris';
    final city = City(
      cityName: 'cityName',
      cityCode: 'cityCode',
      countryName: 'countryName',
      countryCode: 'countryCode',
      regionCode: 'regionCode',
      lat: 0,
      lon: 0,
    );

    final expected = Data.value(
      value: [
        city,
      ],
    );

    when(() => cityRepository.search(any()))
        .thenAnswer((_) async => Future.value(Data.value(value: [city])));

    // act
    final actual = await interactor.search(query);

    // assert
    verify(() => cityRepository.search(query)).called(1);
    expect(actual, expected);
  });

  test(
      'GIVEN weather retrieval is initiated WHEN weather for a city is to be fetched THEN the service invokes "getWeather" with the precise latitude and longitude coordinates',
      () async {
    // arrange
    const lon = 1.0;
    const lat = 2.0;
    final city = City(
      cityName: 'cityName',
      cityCode: 'cityCode',
      countryName: 'countryName',
      countryCode: 'countryCode',
      regionCode: 'regionCode',
      lat: lat,
      lon: lon,
    );
    final weather = Weather(
      temp: 1,
      feelsLike: 2,
      tempMin: 3,
      tempMax: 4,
      pressure: 5,
      humidity: 6,
    );

    final expected = Data.value(
      value: weather,
    );

    when(() => weatherRepository.getWeather(
            lon: any(named: 'lon'), lat: any(named: 'lat')))
        .thenAnswer((_) async => Future.value(Data.value(value: weather)));

    // act
    final actual = await interactor.getWeather(city);

    // assert
    verify(() => weatherRepository.getWeather(lon: lon, lat: lat)).called(1);
    expect(actual, expected);
  });
}
