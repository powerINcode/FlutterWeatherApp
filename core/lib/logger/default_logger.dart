import 'package:core/logger/logger.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:talker_logger/talker_logger.dart';

class DefaultLogger implements Logger {
  static final _logger = TalkerLogger();

  @override
  void debug(message) {
    _logger.debug(message);
  }

  @override
  void error(message, {Object? error, StackTrace? stackTrace}) {
    _logger.error(message);
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
  }

  @override
  void info(message) {
    _logger.info(message);
  }

  @override
  void warning(message) {
    _logger.warning(message);
  }
}
