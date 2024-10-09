import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';
import 'package:wendys_test/domain/use_cases/menu_items/get_menu_items_by_id_use_case.dart';

part 'menu_items_cubit.freezed.dart';
part 'menu_items_state.dart';

class MenuItemsCubit extends Cubit<MenuItemsState> {
  final GetMenuItemsByIdUseCase _getMenuItemsByIdUseCase;

  MenuItemsCubit({
    required GetMenuItemsByIdUseCase getMenuItemsByIdUseCase,
  })  : _getMenuItemsByIdUseCase = getMenuItemsByIdUseCase,
        super(MenuItemsState.initial());

  Future<void> getMenuItemsById(List<int> menuItemsIds) async {
    if (!state.isLoading) {
      final (menuItems, error) = await _getMenuItemsByIdUseCase(menuItemsIds);
      emit(state.copyWith(menuItems: menuItems));
    }
  }
}
