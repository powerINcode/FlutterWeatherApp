import 'package:domain/src/models/weather.dart';

/// Repository responsible for the weather operations
abstract class WeatherRepository {
  /// Fetching [Weather] by the specified [lon] and [lat]
  Future<Weather> getWeather({
    required double lon,
    required double lat,
  });
}
