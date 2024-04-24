import 'package:bloc_test/bloc_test.dart';
import 'package:core/logger/logger.dart';
import 'package:domain/index.dart';
import 'package:flutter_weather_app/features/search/search_cubit.dart';
import 'package:flutter_weather_app/features/search/search_state.dart';
import 'package:mocktail/mocktail.dart';

// Core
class MockLogger extends Mock implements Logger {}

// Repositories
class MockCityRepository extends Mock implements CityRepository {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

// Interactors
class MockWeatherInteractor extends Mock implements WeatherInteractor {}

// Cubits
class MockSearchCubit extends MockCubit<SearchState> implements SearchCubit {}
