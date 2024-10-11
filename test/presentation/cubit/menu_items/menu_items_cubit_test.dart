import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/domain/use_cases/menu_items/get_menu_items_by_id_use_case.dart';
import 'package:wendys_test/presentation/cubit/menu_items/menu_items_cubit.dart';

import '../../../fixtures/categories/category_model_hamburger.dart';
import '../../../fixtures/menu_items/menu_items_model_hamburgers.dart';
import '../../../mocks/mocks.mocks.dart';

void main() {
  group('CategoriesCubit', () {
    late GetMenuItemsByIdUseCase useCase;
    late MenuItemsCubit menuItemsCubit;

    setUp(() {
      useCase = MockGetMenuItemsByIdUseCase();
      menuItemsCubit = MenuItemsCubit(getMenuItemsByIdUseCase: useCase);
    });

    tearDown(() {
      menuItemsCubit.close();
    });

    test('initial state is MenuItemsCubit.initial()', () {
      expect(menuItemsCubit.state, equals(MenuItemsState.initial()));
    });

    blocTest<MenuItemsCubit, MenuItemsState>(
      'emits state with new item list when getCategories is called',
      build: () => menuItemsCubit,
      act: (cubit) {
        when(useCase(mockCategoryHamburger.menuItems))
            .thenAnswer((_) async => (mockMenuItemsHamburgers, null));
        return cubit.getMenuItemsById(mockCategoryHamburger.menuItems);
      },
      expect: () => [
        MenuItemsState(isLoading: true, menuItems: []),
        MenuItemsState(isLoading: false, menuItems: mockMenuItemsHamburgers),
      ],
    );
  });
}
