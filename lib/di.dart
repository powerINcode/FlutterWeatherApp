import 'package:core/logger/default_logger.dart';
import 'package:core/logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:get_secure_storage/get_secure_storage.dart';

abstract class AppModule {
  static void register() {
    final di = GetIt.instance;

    di.registerLazySingleton<Logger>(() => DefaultLogger());
    di.registerFactory<GetSecureStorage>(() => GetSecureStorage());
  }
}
