import 'package:core/logger/logger.dart';
import 'package:domain/index.dart';
import 'package:flutter_weather_app/features/search/search_cubit.dart';
import 'package:get_it/get_it.dart';

abstract class SearchFeatureDependencies {
  static void register() {
    final di = GetIt.instance;

    di.registerFactory(
      () => SearchCubit(
        logger: di.get<Logger>(),
        weatherInteractor: di.get<WeatherInteractor>(),
      ),
    );
  }
}
