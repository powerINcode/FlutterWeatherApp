import 'package:core/data/data.dart';
import 'package:data/src/data_executer.dart';
import 'package:data/src/dto/weather_dto/weather_dto.dart';
import 'package:data/src/services/open_weather_service.dart';
import 'package:domain/index.dart';

class OpenWeatherWeatherRepository implements WeatherRepository {
  const OpenWeatherWeatherRepository({
    required OpenWeatherService service,
    required String apiKey,
  })  : _apiKey = apiKey,
        _service = service;

  final OpenWeatherService _service;
  final String _apiKey;

  @override
  Future<Data<Weather>> getWeather({required double lon, required double lat}) {
    return execute(
      _service.getWeather(appid: _apiKey, lat: lat, lon: lon).then(
            (dto) => dto.toDomain(),
          ),
    );
  }
}
