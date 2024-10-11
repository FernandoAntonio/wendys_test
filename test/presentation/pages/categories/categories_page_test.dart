import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/cart/cart_cubit.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';
import 'package:wendys_test/presentation/cubit/menu_items/menu_items_cubit.dart';
import 'package:wendys_test/presentation/pages/categories/categories_page.dart';
import 'package:wendys_test/presentation/pages/menu_items/menu_items_page.dart';

import '../../../fixtures/categories/categories_model_list_mock.dart';
import '../../../fixtures/categories/category_model_hamburger.dart';
import '../../../mocks/mocks.mocks.dart';

void main() {
  late CategoriesCubit mockCategoriesCubit;
  late MenuItemsCubit mockMenuItemsCubit;
  late CartCubit mockCartCubit;

  setUp(() {
    mockCategoriesCubit = MockCategoriesCubit();
    mockMenuItemsCubit = MockMenuItemsCubit();
    mockCartCubit = MockCartCubit();
    getIt.registerSingleton<CategoriesCubit>(mockCategoriesCubit);
    getIt.registerSingleton<MenuItemsCubit>(mockMenuItemsCubit);
  });

  tearDown(() {
    getIt.reset();
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => mockCategoriesCubit),
        BlocProvider(create: (_) => mockMenuItemsCubit),
        BlocProvider(create: (_) => mockCartCubit),
      ],
      child: MaterialApp(
        home: CategoriesPage(),
      ),
    );
  }

  void arrangeCubitState({
    CategoriesState? categoriesState,
    CartState? cartState,
  }) {
    categoriesState ??= CategoriesState.initial();
    cartState ??= CartState.initial();

    // Cart Cubit
    when(mockCartCubit.state).thenReturn(cartState);

    // Categories Cubit
    when(mockCategoriesCubit.getCategories())
        .thenAnswer((_) async => mockCategoriesCubit);
    when(mockCategoriesCubit.state).thenReturn(categoriesState);

    // Menu Items Cubit for after navigating
    final menuItemsState = MenuItemsState.initial();
    when(mockMenuItemsCubit.getMenuItemsById(mockCategoryHamburger.menuItems))
        .thenAnswer((_) async => mockCategoriesCubit);
    when(mockMenuItemsCubit.state).thenReturn(menuItemsState);
  }

  testWidgets(
    'displays a CircularProgressIndicator when state is loading',
    (WidgetTester tester) async {
      arrangeCubitState(
        categoriesState: CategoriesState(
          isLoading: true,
          categories: [],
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
        categoriesState: CategoriesState(
          isLoading: false,
          categories: mockCategoriesModelList,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      final listFinder = find.byType(Scrollable);

      // Should not find the loading
      final itemFinder = find.byType(CircularProgressIndicator);
      expect(itemFinder, findsNothing);

      // Should find a text that is behind scrolling
      final itemFinder1 = find.text('The Krabby Patty Kollab');
      await tester.scrollUntilVisible(
        itemFinder1,
        500.0,
        scrollable: listFinder,
      );
      expect(itemFinder1, findsOneWidget);

      // Reset scrolling for next search
      await tester.drag(listFinder, Offset(0, double.maxFinite));
      await tester.pumpAndSettle();

      // Should find a text that is on screen
      final itemFinder2 = find.text('Hamburgers');
      await tester.scrollUntilVisible(
        itemFinder2,
        500.0,
        scrollable: listFinder,
        duration: Duration(seconds: 1),
      );
      expect(itemFinder2, findsOneWidget);

      // Reset scrolling for next search
      await tester.drag(listFinder, Offset(0, double.maxFinite));
      await tester.pumpAndSettle();

      // Should find a text that is behind scrolling
      final itemFinder3 = find.text('The Krabby Patty Kollab');
      await tester.scrollUntilVisible(
        itemFinder3,
        500.0,
        scrollable: listFinder,
      );
      expect(itemFinder3, findsOneWidget);
    },
  );

  testWidgets(
    'navigates to MenuItemsPage when category is tapped',
    (WidgetTester tester) async {
      arrangeCubitState(
        categoriesState: CategoriesState(
          isLoading: false,
          categories: mockCategoriesModelList,
        ),
      );
      await tester.pumpWidget(createWidgetUnderTest());

      // Should tap a text that might be behind scrolling
      final listFinder = find.byType(Scrollable);
      final itemFinder = find.text('The Krabby Patty Kollab');
      await tester.scrollUntilVisible(
        itemFinder,
        500.0,
        scrollable: listFinder,
      );

      await tester.tap(itemFinder);
      await tester.pumpAndSettle();

      expect(find.byType(MenuItemsPage), findsOneWidget);
    },
  );
}
