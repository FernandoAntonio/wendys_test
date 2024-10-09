part of 'menu_items_cubit.dart';

@freezed
class MenuItemsState with _$MenuItemsState {
  const MenuItemsState._();

  const factory MenuItemsState({
    required bool isLoading,
    required List<MenuItemModel> menuItems,
  }) = _MenuItemsState;

  factory MenuItemsState.initial() {
    return MenuItemsState(
      isLoading: false,
      menuItems: [],
    );
  }
}
