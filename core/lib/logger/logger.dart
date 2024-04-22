abstract class Logger {
  void debug(dynamic message);

  void info(dynamic message);

  void warning(dynamic message);

  void error(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  });
}
