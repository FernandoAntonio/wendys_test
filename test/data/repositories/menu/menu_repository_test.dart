import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/data/datasources/menu/menu_local_datasource.dart';
import 'package:wendys_test/data/datasources/menu/menu_remote_datasource.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';
import 'package:wendys_test/data/repositories/menu/menu_repository.dart';

import '../../../fixtures/categories/categories_model_list_mock.dart';
import '../../../fixtures/menu/menu_model_mock.dart';
import '../../../fixtures/menu_items/menu_items_model_list_mock.dart';
import 'menu_repository_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<IMenuLocalDatasource>(), MockSpec<IMenuRemoteDatasource>()])
void main() {
  late IMenuLocalDatasource mockLocalDatasource;
  late IMenuRemoteDatasource mockRemoteDatasource;
  late MenuRepository repository;

  setUp(() {
    mockLocalDatasource = MockIMenuLocalDatasource();
    mockRemoteDatasource = MockIMenuRemoteDatasource();
    repository = MenuRepository(
      remoteDatasource: mockRemoteDatasource,
      localDatasource: mockLocalDatasource,
    );
  });

  group('MenuRepository', () {
    final error = Exception('Error Message');

    group('getCategoriesAndCacheData', () {
      test(
          'should return a list of cached CategoryModel when there\'s chached data',
          () async {
        // Arrange
        when(mockLocalDatasource.getCachedCategories())
            .thenAnswer((_) async => mockCategoriesModelList);

        // Act
        final result = await repository.getCategoriesAndCacheData();

        // Assert
        expect(result, (mockCategoriesModelList, null));
        verify(mockLocalDatasource.getCachedCategories()).called(1);
      });

      test('should return a list of CategoryModel when call is successful',
          () async {
        // Arrange
        var firstCall = true;
        when(mockLocalDatasource.getCachedCategories()).thenAnswer((_) async {
          if (firstCall) {
            firstCall = false;
            return [];
          }
          return mockCategoriesModelList;
        });
        when(mockRemoteDatasource.getMenu())
            .thenAnswer((_) async => mockMenuModel);

        // Act
        final result = await repository.getCategoriesAndCacheData();

        // Assert
        expect(result, (mockCategoriesModelList, null));
        verify(mockRemoteDatasource.getMenu()).called(1);
        verify(mockLocalDatasource.getCachedCategories()).called(2);
        verify(mockLocalDatasource.storeCategories(mockCategoriesModelList))
            .called(1);
        verify(mockLocalDatasource.storeMenuItems(mockMenuItemsModelList))
            .called(1);
      });

      test('should return an empty list when call is unsuccessful', () async {
        // Arrange
        when(mockLocalDatasource.getCachedCategories()).thenThrow(error);

        // Act
        final result = await repository.getCategoriesAndCacheData();

        // Assert
        expect(result.$1, <CategoryModel>[]);
        expect(result.$2, error.toString());
        verify(mockLocalDatasource.getCachedCategories()).called(1);
        verifyNever(mockRemoteDatasource.getMenu());
        verifyNever(mockLocalDatasource.storeCategories([]));
        verifyNever(mockLocalDatasource.storeMenuItems([]));
      });
    });

    group('getMenuItems', () {
      test(
          'should return a list of cached MenuItemModel when call is successful',
          () async {
        // Arrange
        when(mockLocalDatasource.getCachedMenuItems())
            .thenAnswer((_) async => mockMenuItemsModelList);

        // Act
        final result = await repository.getMenuItems();

        // Assert
        expect(result, (mockMenuItemsModelList, null));
        verify(mockLocalDatasource.getCachedMenuItems()).called(1);
      });

      test('should throw an exception when call is unsuccessful', () async {
        // Arrange
        when(mockLocalDatasource.getCachedMenuItems()).thenThrow(error);

        // Act
        final result = await repository.getMenuItems();

        // Assert
        expect(result.$1, <MenuItemModel>[]);
        expect(result.$2, error.toString());
        verify(mockLocalDatasource.getCachedMenuItems()).called(1);
      });
    });
  });
}
