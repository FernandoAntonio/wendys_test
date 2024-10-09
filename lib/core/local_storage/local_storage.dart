import 'package:shared_preferences/shared_preferences.dart';
import 'package:wendys_test/core/local_storage/entities/local_storage_keys.dart';

abstract class ILocalStorage {
  Future<void> write(LocalStorageKeys key, String value);

  Future<String?> read(LocalStorageKeys key);

  Future<String?> update(LocalStorageKeys key, String value);

  Future<void> delete(LocalStorageKeys key);

  Future<void> clear();
}

class DefaultLocalStorage implements ILocalStorage {
  final SharedPreferences _sharedPreferences;

  const DefaultLocalStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<void> write(LocalStorageKeys key, String value) async {
    await _sharedPreferences.setString(key.toString(), value);
  }

  @override
  Future<void> delete(LocalStorageKeys key) async {
    await _sharedPreferences.remove(key.toString());
  }

  @override
  Future<String?> read(LocalStorageKeys key) async {
    String? value = _sharedPreferences.getString(key.toString());

    return value;
  }

  @override
  Future<String?> update(LocalStorageKeys key, String value) async {
    await _sharedPreferences.setString(key.toString(), value);
    String? updatedValue = _sharedPreferences.getString(key.toString());

    return updatedValue;
  }

  @override
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
