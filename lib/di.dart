import 'package:core/logger/default_logger.dart';
import 'package:core/logger/logger.dart';
import 'package:core/logger/storage/local_storage.dart';
import 'package:core/logger/storage/secure_storage.dart';
import 'package:core/logger/storage/secure_storage_impl.dart';
import 'package:core/logger/storage/storage.dart';
import 'package:data/index.dart';
import 'package:flutter_weather_app/environment_configuration.dart';
import 'package:get_it/get_it.dart';

abstract class AppModule {
  static void register(EnvironmentConfiguration configuration) {
    final di = GetIt.instance;

    di.registerLazySingleton<Logger>(() => DefaultLogger());
    di.registerLazySingleton<SecureStorage>(() => SecureStorageImpl());
    di.registerLazySingleton<Storage>(() => LocalStorage());

    DataModule.register(
      DataConfiguration(
        amadeus: AmadeusConfiguration(
          url: configuration.amadeusUrl,
          clientId: configuration.amadeusClientId,
          clientSecret: configuration.amadeusClientSecret,
        ),
        openWeather: OpenWeatherConfiguration(
          url: configuration.openWeatherUrl,
          apiKey: configuration.openWeatherApiKey,
        ),
      ),
    );
  }
}
