import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';
import 'package:wendys_test/domain/use_cases/menu_items/get_menu_items_by_id_use_case.dart';

import '../../../fixtures/categories/category_model_hamburger.dart';
import '../../../fixtures/menu_items/menu_items_model_hamburgers.dart';
import '../../../fixtures/menu_items/menu_items_model_list_mock.dart';
import '../../../mocks/mocks.mocks.dart';

void main() {
  late MockIMenuRepository mockMenuRepository;
  late GetMenuItemsByIdUseCase useCase;

  setUp(() {
    mockMenuRepository = MockIMenuRepository();
    useCase = GetMenuItemsByIdUseCase(repository: mockMenuRepository);
  });

  group('GetCategoriesUseCase', () {
    final errorMessage = 'Error Message';
    final menuItemsIds = mockCategoryHamburger.menuItems;

    test(
        'should return a filtered list of MenuItemModel when call is successful',
        () async {
      // Arrange
      when(mockMenuRepository.getMenuItems())
          .thenAnswer((_) async => (mockMenuItemsModelList, null));

      // Act
      final result = await useCase(menuItemsIds);

      // Assert
      expect(result.$1, mockMenuItemsHamburgers);
      expect(result.$2, null);
      verify(mockMenuRepository.getMenuItems()).called(1);
    });

    test('should return an empty list and an error message when call fails',
        () async {
      // Arrange
      when(mockMenuRepository.getMenuItems())
          .thenAnswer((_) async => (<MenuItemModel>[], errorMessage));

      // Act
      final result = await useCase(menuItemsIds);

      // Assert
      expect(result.$1, <MenuItemModel>[]);
      expect(result.$2, errorMessage);
      verify(mockMenuRepository.getMenuItems()).called(1);
    });
  });
}
