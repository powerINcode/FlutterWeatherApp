/// Storage abstraction
abstract class Storage {
  /// Reads value by [key]
  Future<String?> read(String key);

  /// Write [value] by [key]
  Future<void> write({
    required String key,
    required String value,
  });
}
