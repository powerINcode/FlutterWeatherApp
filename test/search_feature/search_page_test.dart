import 'package:core/data/data.dart';
import 'package:domain/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/features/search/search_cubit.dart';
import 'package:flutter_weather_app/features/search/search_page.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils/app_builder.dart';
import '../utils/faker.dart';

void main() {
  late WeatherInteractor weatherInteractor;

  setUpAll(() {
    regitsterFakes();

    final di = GetIt.instance;

    weatherInteractor = MockWeatherInteractor();
    di.registerFactory(
      () => SearchCubit(
        weatherInteractor: weatherInteractor,
      ),
    );
  });

  testWidgets('GIVEN empty state WHEN app launch THEN placeholder is visible',
      (tester) async {
    // arrange
    final page = buildApplication(const SearchPage());
    final placeholder = find.text('Start typing to search cities');

    // act
    await tester.pumpWidget(page);

    // assert
    expect(placeholder, findsOneWidget);
  });

  testWidgets(
      'GIVEN empty state WHEN user enter city THEN shows list of cities',
      (tester) async {
    // arrange
    const inputKey = Key('input');
    const citiesKey = Key('cities');
    final page = buildApplication(const SearchPage());
    const query = 'Paris';
    final city = City(
      cityName: query,
      cityCode: 'cityCode',
      countryName: 'countryName',
      countryCode: 'countryCode',
      regionCode: 'regionCode',
      lat: 0,
      lon: 0,
    );

    when(() => weatherInteractor.search(any()))
        .thenAnswer((_) => Future.value(Data.value(value: [city])));

    final input = find.byKey(inputKey);
    final cities = find.byKey(citiesKey);

    // act
    await tester.runAsync(() async {
      await tester.pumpWidget(page);
      await tester.enterText(input, query);
      await Future.delayed(const Duration(milliseconds: 300));
      await tester.pumpAndSettle();

      // assert
      expect(cities, findsOneWidget);
    });
  });

  testWidgets(
      'GIVEN state with cities WHEN user select city THEN shows weather',
      (tester) async {
    // arrange
    const inputKey = Key('input');
    const firstCityKey = Key('city_0');
    const weatherKey = Key('weather');
    final page = buildApplication(const SearchPage());
    const query = 'Paris';
    final city = City(
      cityName: query,
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

    when(() => weatherInteractor.search(any()))
        .thenAnswer((_) => Future.value(Data.value(value: [city])));

    when(() => weatherInteractor.getWeather(any()))
        .thenAnswer((_) => Future.value(Data.value(value: weather)));

    final input = find.byKey(inputKey);
    final firstCity = find.byKey(firstCityKey);
    final weatherCity = find.byKey(weatherKey);

    // act
    await tester.runAsync(() async {
      await tester.pumpWidget(page);
      await tester.enterText(input, query);
      await Future.delayed(const Duration(milliseconds: 300));
      await tester.pumpAndSettle();

      tester.tap(firstCity);
      await Future.delayed(const Duration(milliseconds: 300));
      await tester.pumpAndSettle();

      // assert
      expect(weatherCity, findsOneWidget);
    });
  });
}
