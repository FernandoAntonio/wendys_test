import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/core/local_storage/entities/local_storage_keys.dart';
import 'package:wendys_test/core/local_storage/local_storage.dart';
import 'package:wendys_test/data/datasources/menu/menu_local_datasource.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';

import '../../../fixtures/categories/categories_model_list_mock.dart';
import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/menu_items/menu_items_model_list_mock.dart';
import 'menu_local_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ILocalStorage>()])
void main() {
  late ILocalStorage mockLocalStorage;
  late MenuLocalDatasource localDatasource;

  setUp(() {
    mockLocalStorage = MockILocalStorage();
    localDatasource = MenuLocalDatasource(localStorage: mockLocalStorage);
  });

  group('MenuLocalDatasource', () {
    final categoriesString = fixture('categories/categories_list');
    final menuItemsString = fixture('menu_items/menu_items_list');

    group('getCachedCategories', () {
      test('should return a list of CategoryModel when the call is successful',
          () async {
        // Arrange
        when(mockLocalStorage.read(LocalStorageKeys.categories))
            .thenAnswer((_) async => categoriesString);

        // Act
        final result = await localDatasource.getCachedCategories();

        // Assert
        expect(result, isA<List<CategoryModel>>());
        verify(mockLocalStorage.read(LocalStorageKeys.categories)).called(1);
      });

      test('should return an empty list when the call is unsuccessful',
          () async {
        // Arrange
        when(mockLocalStorage.read(LocalStorageKeys.categories))
            .thenAnswer((_) async => null);

        // Act
        final result = await localDatasource.getCachedCategories();

        // Assert
        expect(result, []);
        verify(mockLocalStorage.read(LocalStorageKeys.categories)).called(1);
      });
    });

    group('getCachedMenuItems', () {
      test('should return a list of MenuItemModel when the call is successful',
          () async {
        // Arrange
        when(mockLocalStorage.read(LocalStorageKeys.menuItems))
            .thenAnswer((_) async => menuItemsString);

        // Act
        final result = await localDatasource.getCachedMenuItems();

        // Assert
        expect(result, isA<List<MenuItemModel>>());
        verify(mockLocalStorage.read(LocalStorageKeys.menuItems)).called(1);
      });

      test('should return an empty list when the call is unsuccessful',
          () async {
        // Arrange
        when(mockLocalStorage.read(LocalStorageKeys.menuItems))
            .thenAnswer((_) async => null);

        // Act
        final result = await localDatasource.getCachedMenuItems();

        // Assert
        expect(result, []);
        verify(mockLocalStorage.read(LocalStorageKeys.menuItems)).called(1);
      });
    });

    group('storeCategories', () {
      test('should write the correct data in local storage when successful',
          () async {
        // Act
        await localDatasource.storeCategories(mockCategoriesModelList);

        // Assert
        verify(mockLocalStorage.write(
          LocalStorageKeys.categories,
          mockCategoriesModelString,
        )).called(1);
      });
    });

    group('storeMenuItems', () {
      test('should write the correct data in local storage when successful',
          () async {
        // Act
        await localDatasource.storeMenuItems(mockMenuItemsModelList);

        // Assert
        verify(mockLocalStorage.write(
          LocalStorageKeys.menuItems,
          mockMenuItemsModelString,
        )).called(1);
      });
    });
  });
}
