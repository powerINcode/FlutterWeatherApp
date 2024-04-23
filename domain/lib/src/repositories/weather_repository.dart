import 'package:core/data/data.dart';
import 'package:domain/src/models/weather.dart';

/// Repository responsible for the weather operations
abstract class WeatherRepository {
  /// Fetching [Weather] by the specified [lon] and [lat]
  Future<Data<Weather>> getWeather({
    required double lon,
    required double lat,
  });
}
