import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/cart/cart_cubit.dart';
import 'package:wendys_test/presentation/cubit/menu_items/menu_items_cubit.dart';
import 'package:wendys_test/presentation/pages/menu_items/menu_items_page.dart';
import 'package:wendys_test/presentation/pages/selected_menu_item/selected_menu_item_page.dart';

import '../../../fixtures/categories/category_model_hamburger.dart';
import '../../../fixtures/menu_items/menu_items_model_hamburgers.dart';
import '../../../fixtures/menu_items/menu_items_model_list_mock.dart';
import '../../../mocks/mocks.mocks.dart';

void main() {
  late MenuItemsCubit mockMenuItemsCubit;
  late CartCubit mockCartCubit;

  setUp(() {
    mockMenuItemsCubit = MockMenuItemsCubit();
    mockCartCubit = MockCartCubit();
    getIt.registerSingleton<MenuItemsCubit>(mockMenuItemsCubit);
  });

  tearDown(() {
    getIt.reset();
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => mockMenuItemsCubit),
        BlocProvider(create: (_) => mockCartCubit),
      ],
      child: MaterialApp(
        home: MenuItemsPage(
          selectedCategory: mockCategoryHamburger,
        ),
      ),
    );
  }

  void arrangeCubitState({MenuItemsState? menuItemsState}) {
    // Menu Items Cubit for after navigating
    menuItemsState ??= MenuItemsState.initial();
    when(mockMenuItemsCubit.getMenuItemsById(mockCategoryHamburger.menuItems))
        .thenAnswer((_) async => mockMenuItemsModelList);
    when(mockMenuItemsCubit.state).thenReturn(menuItemsState);

    // Cart Cubit
    final cartState = CartState.initial();
    when(mockCartCubit.state).thenReturn(cartState);
  }

  testWidgets(
    'displays a CircularProgressIndicator when state is loading',
    (WidgetTester tester) async {
      arrangeCubitState(
        menuItemsState: MenuItemsState(
          isLoading: true,
          menuItems: [],
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      // Should not find the GridView
      final itemFinder = find.byType(GridView);
      expect(itemFinder, findsNothing);

      // Should find the loading
      final itemFinder1 = find.byType(CircularProgressIndicator);
      expect(itemFinder1, findsOneWidget);
    },
  );

  testWidgets(
    'displays categories when state is loaded',
    (WidgetTester tester) async {
      arrangeCubitState(
        menuItemsState: MenuItemsState(
          isLoading: false,
          menuItems: mockMenuItemsHamburgers,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      final listFinder = find.byType(Scrollable);

      // Should not find the loading
      final itemFinder = find.byType(CircularProgressIndicator);
      expect(itemFinder, findsNothing);

      // Should find a text that might be behind scrolling
      final itemFinder1 = find.text('Dave\'s Single®');
      await tester.scrollUntilVisible(
        itemFinder1,
        500.0,
        scrollable: listFinder,
      );
      expect(itemFinder1, findsOneWidget);
    },
  );

  testWidgets(
    'navigates to MenuItemsPage when category is tapped',
    (WidgetTester tester) async {
      arrangeCubitState(
        menuItemsState: MenuItemsState(
          isLoading: false,
          menuItems: mockMenuItemsHamburgers,
        ),
      );
      await tester.pumpWidget(createWidgetUnderTest());

      // Should tap a text that might be behind scrolling
      final listFinder = find.byType(Scrollable);
      final itemFinder = find.text('Dave\'s Single®');
      await tester.scrollUntilVisible(
        itemFinder,
        500.0,
        scrollable: listFinder,
      );

      await tester.tap(itemFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SelectedMenuItemPage), findsOneWidget);
    },
  );
}
