import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wendys_test/presentation/cubit/cart/cart_cubit.dart';

import '../../../fixtures/menu_items/menu_items_model_list_mock.dart';

void main() {
  group('CartCubit', () {
    late CartCubit cartCubit;

    setUp(() {
      cartCubit = CartCubit();
    });

    tearDown(() {
      cartCubit.close();
    });

    final mockMenuItem = mockMenuItemsModelList.first;

    test('initial state is CartState.initial()', () {
      expect(cartCubit.state, equals(CartState.initial()));
    });

    blocTest<CartCubit, CartState>(
      'emits state with new item when addToCart is called',
      build: () => cartCubit,
      act: (cubit) => cubit.addToCart(mockMenuItem),
      expect: () => [
        CartState(items: [mockMenuItem]),
      ],
    );

    blocTest<CartCubit, CartState>(
      'emits state with empty cart when clearCart is called',
      build: () => cartCubit,
      act: (cubit) => cubit.clearCart(),
      seed: () => CartState(items: [mockMenuItem]),
      expect: () => [CartState(items: [])],
    );
  });
}
