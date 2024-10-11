import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/cart/cart_cubit.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';
import 'package:wendys_test/presentation/pages/categories/categories_page.dart';

import '../../../fixtures/categories/categories_model_list_mock.dart';
import '../../../mocks/mocks.mocks.dart';

void main() {
  late CategoriesCubit mockCategoriesCubit;
  late CartCubit mockCartCubit;

  setUp(() {
    mockCategoriesCubit = MockCategoriesCubit();
    mockCartCubit = MockCartCubit();
    getIt.registerSingleton<CategoriesCubit>(mockCategoriesCubit);
  });

  tearDown(() {
    getIt.reset();
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => mockCategoriesCubit),
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

    when(mockCartCubit.state).thenReturn(cartState);
    when(mockCategoriesCubit.getCategories())
        .thenAnswer((_) async => mockCategoriesCubit);
    when(mockCategoriesCubit.state).thenReturn(categoriesState);
  }

  testWidgets('displays categories when state is loaded',
      (WidgetTester tester) async {
    arrangeCubitState(
      categoriesState: CategoriesState(
        isLoading: false,
        categories: mockCategoriesModelList,
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    final listFinder = find.byType(Scrollable);

    // Find a text that is behind scrolling
    final itemFinder2 = find.text('The Krabby Patty Kollab');
    await tester.scrollUntilVisible(
      itemFinder2,
      500.0,
      scrollable: listFinder,
    );
    expect(itemFinder2, findsOneWidget);

    // Reset scrolling for next search
    await tester.drag(listFinder, Offset(0, double.maxFinite));
    await tester.pumpAndSettle();

    // Find a text that is on screen
    final itemFinder1 = find.text('Hamburgers');
    await tester.scrollUntilVisible(
      itemFinder1,
      500.0,
      scrollable: listFinder,
      duration: Duration(seconds: 1),
    );
    expect(itemFinder1, findsOneWidget);

    // Reset scrolling for next search
    await tester.drag(listFinder, Offset(0, double.maxFinite));
    await tester.pumpAndSettle();

    // Find a text that is behind scrolling
    final itemFinder3 = find.text('The Krabby Patty Kollab');
    await tester.scrollUntilVisible(
      itemFinder3,
      500.0,
      scrollable: listFinder,
    );
    expect(itemFinder3, findsOneWidget);
  });
}
