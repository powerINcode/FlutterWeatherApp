import 'package:core/data/data.dart';
import 'package:domain/index.dart';

abstract class WeatherInteractor {
  /// Search for the available cities for the weather forecasting by [query]
  Future<Data<List<City>>> search(String query);

  /// Get the weather for the [City]
  Future<Data<Weather>> getWeather(City city);
}
