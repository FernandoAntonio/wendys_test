import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/cart/cart_cubit.dart';
import 'package:wendys_test/presentation/pages/selected_menu_item/selected_menu_item_page.dart';

import '../../../fixtures/menu_items/menu_items_model_hamburgers.dart';
import '../../../mocks/mocks.mocks.dart';

void main() {
  late CartCubit mockCartCubit;
  late NavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockCartCubit = MockCartCubit();
    mockNavigatorObserver = MockNavigatorObserver();
    getIt.registerSingleton<CartCubit>(mockCartCubit);
  });

  tearDown(() {
    getIt.reset();
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => mockCartCubit),
      ],
      child: MaterialApp(
        home: SelectedMenuItemPage(
          selectedMenuItem: mockMenuItemBaconator,
        ),
        navigatorObservers: [mockNavigatorObserver],
      ),
    );
  }

  void arrangeCubitState() {
    final cartState = CartState.initial();
    when(mockCartCubit.state).thenReturn(cartState);
  }

  testWidgets(
    'displays a single menuItem when state is loaded',
    (WidgetTester tester) async {
      arrangeCubitState();

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Baconator®'), findsExactly(2));
      expect(find.text('\$5.89'), findsOneWidget);
      expect(find.text('960 Cal'), findsOneWidget);
    },
  );

  testWidgets(
    'clears cart when the icon is long pressed',
    (WidgetTester tester) async {
      arrangeCubitState();

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.longPress(find.byKey(Key('cart_widget')));
      await tester.pumpAndSettle();

      expect(find.text('Cart cleared'), findsOneWidget);
      verify(mockCartCubit.clearCart()).called(1);
    },
  );

  testWidgets(
    'displays snackBar and adds item to cart when FAB is pressed',
    (WidgetTester tester) async {
      arrangeCubitState();
      final route = MaterialPageRoute(
        builder: (_) => BlocProvider<CartCubit>(
          create: (_) => mockCartCubit,
          child: SelectedMenuItemPage(
            selectedMenuItem: mockMenuItemBaconator,
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () => Navigator.push(context, route),
                  child: const Text('Go to Selected Menu Item'),
                );
              },
            ),
          ),
          navigatorObservers: [mockNavigatorObserver],
        ),
      );

      await tester.tap(find.text('Go to Selected Menu Item'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      verify(mockNavigatorObserver.didPop(route, any)).called(1);
      expect(find.text('Baconator® added to the cart'), findsOneWidget);
      verify(mockCartCubit.addToCart(mockMenuItemBaconator)).called(1);
    },
  );
}
