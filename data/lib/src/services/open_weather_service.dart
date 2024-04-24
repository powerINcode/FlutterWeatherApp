import 'package:data/src/dto/weather_dto/weather_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'open_weather_service.g.dart';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/')
abstract class OpenWeatherService {
  factory OpenWeatherService(Dio dio, {String baseUrl}) = _OpenWeatherService;

  @GET('/weather')
  Future<WeatherDto> getWeather({
    @Query('appid') required String appId,
    @Query('lat') required double lat,
    @Query('lon') required double lon,
  });
}
