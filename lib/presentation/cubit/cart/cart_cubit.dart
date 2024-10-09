import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  addToCart(MenuItemModel item) {
    final cartItems = [...state.items, item];
    emit(state.copyWith(items: cartItems));
  }

  clearCart() {
    emit(state.copyWith(items: []));
  }
}
