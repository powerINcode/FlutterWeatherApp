import 'package:core/logger/storage/secure_storage.dart';
import 'package:data/src/data_configuration.dart';
import 'package:data/src/interceptors/amadeus_inteceptor.dart';
import 'package:data/src/interceptors/open_weather_inteceptor.dart';
import 'package:data/src/services/amadeus_city_service.dart';
import 'package:data/src/services/auth_service.dart';
import 'package:data/src/services/open_weather_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

abstract class DataModule {
  static void register(DataConfiguration configuration) {
    final di = GetIt.instance;

    di.registerLazySingleton<AmadeusCityService>(() {
      final authService = di.get<AuthService>();
      final secureStorage = di.get<SecureStorage>();

      final dio = _buildDio(configuration.amadeus.url)
        ..interceptors.add(AmadeusInterceptor(
          service: authService,
          storage: secureStorage,
          clientId: configuration.amadeus.clientId,
          clientSecret: configuration.amadeus.clientSecret,
        ));

      return AmadeusCityService(dio);
    });

    di.registerLazySingleton<OpenWeatherService>(() {
      final dio = _buildDio(configuration.openWeather.url);

      return OpenWeatherService(dio);
    });

    di.registerLazySingleton<AuthService>(() {
      final dio = _buildDio('')
        ..interceptors.add(
          OpenWeatherInterceptor(apiKey: configuration.openWeather.apiKey),
        );

      return AuthService(dio);
    });
  }

  static Dio _buildDio(String baseUrl) {
    return Dio(BaseOptions(
      baseUrl: baseUrl,
    ))
      ..interceptors.add(TalkerDioLogger());
  }
}
