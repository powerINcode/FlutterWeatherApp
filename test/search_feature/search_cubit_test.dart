import 'package:bloc_test/bloc_test.dart';
import 'package:core/data/data.dart';
import 'package:domain/index.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_weather_app/features/search/search_cubit.dart';
import 'package:flutter_weather_app/features/search/search_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../utils/faker.dart';
import '../mocks.dart';

void main() {
  late SearchCubit cubit;
  late MockWeatherInteractor weatherInteractor;

  setUpAll(() => regitsterFakes());

  setUp(() {
    weatherInteractor = MockWeatherInteractor();

    cubit = SearchCubit(weatherInteractor: weatherInteractor);
  });

  group('SearchCubit', () {
    blocTest<SearchCubit, SearchState>(
      'GIVEN intial state of cubit WHEN intiialize THEN emit empty state',
      build: () => cubit,
      expect: () => const <SearchState>[],
    );

    test(
        "GIVEN intial state of cubit WHEN search for cities THEN emit state with search results",
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
      final expected = SearchState(cities: Data.value(value: [city]));

      when(() => weatherInteractor.search(any()))
          .thenAnswer((_) => Future.value(Data.value(value: [city])));

      // act
      fakeAsync((_) async {
        await cubit.init();
        cubit.search(query);

        // assert
        verify(() => weatherInteractor.search(query)).called(1);
        expect(cubit.state, expected);
      });
    });
  });

  test(
      "GIVEN state with cities WHEN click on a city THEN emit state with weather results",
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
    final weather = Weather(
      temp: 1,
      feelsLike: 2,
      tempMin: 3,
      tempMax: 4,
      pressure: 5,
      humidity: 6,
    );
    final expected = SearchState(
        cities: Data.value(
          value: [city],
        ),
        selectedCity: city,
        weather: weather);

    when(() => weatherInteractor.search(any()))
        .thenAnswer((_) => Future.value(Data.value(value: [city])));

    when(() => weatherInteractor.getWeather(any()))
        .thenAnswer((_) => Future.value(Data.value(value: weather)));

    // act
    fakeAsync((_) async {
      await cubit.init();
      cubit.search(query);
      cubit.selectCity(city);

      // assert
      verify(() => weatherInteractor.search(query)).called(1);
      verify(() => weatherInteractor.getWeather(city)).called(1);
      expect(cubit.state, expected);
    });
  });
}
