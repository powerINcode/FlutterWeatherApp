import 'package:domain/index.dart';
import 'package:get_it/get_it.dart';

abstract class DomainModule {
  static register() {
    final di = GetIt.instance;

    di.registerLazySingleton<WeatherInteractor>(() => WeatherInteractorImpl(
          cityRepository: di.get<CityRepository>(),
          weatherRepository: di.get<WeatherRepository>(),
        ));
  }
}
