import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

abstract class DataModule {
  static void register() {
    final di = GetIt.instance;

    di.registerLazySingleton<Dio>(() {
      return Dio()..interceptors.add(TalkerDioLogger());
    });
  }
}
