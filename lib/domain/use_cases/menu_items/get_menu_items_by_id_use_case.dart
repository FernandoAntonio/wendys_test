import 'package:wendys_test/core/use_cases/i_use_case.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';
import 'package:wendys_test/domain/repositories/menu/i_menu_repository.dart';

class GetMenuItemsByIdUseCase
    implements IUseCase<List<MenuItemModel>, List<int>> {
  final IMenuRepository _repository;

  const GetMenuItemsByIdUseCase({
    required IMenuRepository repository,
  }) : _repository = repository;

  @override
  Future<(List<MenuItemModel>, String?)> call(params) async {
    final (allMenuItems, error) = await _repository.getMenuItems();

    if (error != null) return (<MenuItemModel>[], null);

    final filteredMenuItems =
        allMenuItems.where((e) => params.contains(e.menuItemId)).toList();

    return (filteredMenuItems, null);
  }
}
