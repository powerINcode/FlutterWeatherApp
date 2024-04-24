import 'package:core/logger/logger.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart' as log;

class DefaultLogger implements Logger {
  final _logger = log.Logger(
    printer: log.PrettyPrinter(),
  );

  @override
  void debug(message) {
    _logger.d(message);
  }

  @override
  void error(message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message);
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
  }

  @override
  void info(message) {
    _logger.i(message);
  }

  @override
  void warning(message) {
    _logger.w(message);
  }
}
