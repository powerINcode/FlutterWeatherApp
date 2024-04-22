import 'package:core/logger/default_logger.dart';
import 'package:core/logger/logger.dart';
import 'package:core/logger/storage/local_storage.dart';
import 'package:core/logger/storage/secure_storage.dart';
import 'package:core/logger/storage/secure_storage_impl.dart';
import 'package:core/logger/storage/storage.dart';
import 'package:get_it/get_it.dart';

abstract class AppModule {
  static void register() {
    final di = GetIt.instance;

    di.registerLazySingleton<Logger>(() => DefaultLogger());
    di.registerFactory<SecureStorage>(() => SecureStorageImpl());
    di.registerFactory<Storage>(() => LocalStorage());
  }
}
