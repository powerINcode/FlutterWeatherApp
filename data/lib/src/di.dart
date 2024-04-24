import 'package:core/logger/storage/secure_storage.dart';
import 'package:data/src/data_configuration.dart';
import 'package:data/src/interceptors/amadeus_inteceptor.dart';
import 'package:data/src/interceptors/open_weather_inteceptor.dart';
import 'package:data/src/repositories/amadeus_city_repository.dart';
import 'package:data/src/repositories/openweather_weather_repository.dart';
import 'package:data/src/services/amadeus_city_service.dart';
import 'package:data/src/services/amadeus_auth_service.dart';
import 'package:data/src/services/open_weather_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/index.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DataModule {
  static void register(DataConfiguration configuration) {
    final di = GetIt.instance;

    _services(di, configuration);
    _repositories(di, configuration);
  }

  static void _services(GetIt di, DataConfiguration configuration) {
    di.registerLazySingleton<AmadeusCityService>(() {
      final authService = di.get<AmadeusAuthService>();
      final secureStorage = di.get<SecureStorage>();

      final dio = _buildDio()
        ..interceptors.add(AmadeusInterceptor(
          service: authService,
          storage: secureStorage,
          clientId: configuration.amadeus.clientId,
          clientSecret: configuration.amadeus.clientSecret,
        ));

      return AmadeusCityService(dio, baseUrl: configuration.amadeus.url);
    });

    di.registerLazySingleton<OpenWeatherService>(() {
      final dio = _buildDio()
        ..interceptors.add(
          OpenWeatherInterceptor(apiKey: configuration.openWeather.apiKey),
        );

      return OpenWeatherService(dio, baseUrl: configuration.openWeather.url);
    });

    di.registerLazySingleton<AmadeusAuthService>(() {
      final dio = _buildDio();

      return AmadeusAuthService(dio, baseUrl: configuration.amadeus.url);
    });
  }

  static void _repositories(GetIt di, DataConfiguration configuration) {
    di.registerLazySingleton<CityRepository>(() {
      final service = di.get<AmadeusCityService>();

      return AmadeusCityRepository(service: service);
    });

    di.registerLazySingleton<WeatherRepository>(() {
      final service = di.get<OpenWeatherService>();

      return OpenWeatherWeatherRepository(
        service: service,
        apiKey: configuration.openWeather.apiKey,
      );
    });
  }

  static Dio _buildDio() {
    return Dio(BaseOptions())
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
  }
}
