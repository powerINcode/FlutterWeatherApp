import 'package:core/logger/storage/secure_storage.dart';
import 'package:get_secure_storage/get_secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  final GetSecureStorage _box = GetSecureStorage();

  @override
  Future<String?> read(String key) async {
    return _box.read(key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    _box.write(key, value);
  }
}
