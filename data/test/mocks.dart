import 'package:data/src/services/amadeus_city_service.dart';
import 'package:data/src/services/open_weather_service.dart';
import 'package:mocktail/mocktail.dart';

class MockAmadeusCityService extends Mock implements AmadeusCityService {}

class MockOpenWeatherService extends Mock implements OpenWeatherService {}
