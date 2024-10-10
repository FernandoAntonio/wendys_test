import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/core/local_storage/entities/local_storage_keys.dart';
import 'package:wendys_test/core/local_storage/local_storage.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late DefaultLocalStorage localStorage;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localStorage =
        DefaultLocalStorage(sharedPreferences: mockSharedPreferences);
  });

  group('DefaultLocalStorage', () {
    const key = LocalStorageKeys.categories;
    const value = 'value';

    test('write should save a value to SharedPreferences', () async {
      when(mockSharedPreferences.setString(key.toString(), value))
          .thenAnswer((_) async => true);

      await localStorage.write(key, value);

      verify(mockSharedPreferences.setString(key.toString(), value)).called(1);
    });

    test('read should return the saved value', () async {
      when(mockSharedPreferences.getString(key.toString())).thenReturn(value);

      final result = await localStorage.read(key);

      expect(result, value);
      verify(mockSharedPreferences.getString(key.toString())).called(1);
    });

    test('read should return null if the key does not exist', () async {
      when(mockSharedPreferences.getString(key.toString())).thenReturn(null);

      final result = await localStorage.read(key);

      expect(result, null);
      verify(mockSharedPreferences.getString(key.toString())).called(1);
    });

    test('update should update the value and return the updated value',
        () async {
      when(mockSharedPreferences.setString(key.toString(), value))
          .thenAnswer((_) async => true);
      when(mockSharedPreferences.getString(key.toString())).thenReturn(value);

      final result = await localStorage.update(key, value);

      expect(result, value);
      verify(mockSharedPreferences.setString(key.toString(), value)).called(1);
      verify(mockSharedPreferences.getString(key.toString())).called(1);
    });

    test('delete should remove the value from SharedPreferences', () async {
      when(mockSharedPreferences.remove(key.toString()))
          .thenAnswer((_) async => true);

      await localStorage.delete(key);

      verify(mockSharedPreferences.remove(key.toString())).called(1);
    });

    test('clear should call clear on SharedPreferences', () async {
      when(mockSharedPreferences.clear()).thenAnswer((_) async => true);

      await localStorage.clear();

      verify(mockSharedPreferences.clear()).called(1);
    });
  });
}
