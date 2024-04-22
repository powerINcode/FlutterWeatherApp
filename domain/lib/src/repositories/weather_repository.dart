import 'package:domain/src/models/weather.dart';

/// Repository responsible for the weather operations
abstract class WeatherRepository {
  /// Fetching [Weather] by the specified [log] and [lat]
  Future<Weather> getWeather({
    required double long,
    required double lat,
  });
}
