part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<MenuItemModel> items,
  }) = _CartState;

  factory CartState.initial() {
    return CartState(
      items: [],
    );
  }
}
