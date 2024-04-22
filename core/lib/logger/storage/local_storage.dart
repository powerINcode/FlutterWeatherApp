import 'package:core/logger/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements Storage {
  @override
  Future<String?> read(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(key, value).then((_) => null);
  }
}
