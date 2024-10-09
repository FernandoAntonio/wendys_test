import 'package:wendys_test/data/datasources/menu/menu_local_datasource.dart';
import 'package:wendys_test/data/datasources/menu/menu_remote_datasource.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';
import 'package:wendys_test/domain/repositories/menu/i_menu_repository.dart';

class MenuRepository implements IMenuRepository {
  final IMenuRemoteDatasource _remoteDatasource;
  final IMenuLocalDatasource _localDatasource;

  const MenuRepository({
    required IMenuRemoteDatasource remoteDatasource,
    required IMenuLocalDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<(List<CategoryModel>, String?)> getCategoriesAndCacheData() async {
    try {
      final cachedCategories = await _localDatasource.getCachedCategories();
      if (cachedCategories.isNotEmpty) {
        return (cachedCategories, null);
      }

      final menu = await _remoteDatasource.getMenu();
      await _localDatasource.storeCategories(menu.menuLists.categories);
      await _localDatasource.storeMenuItems(menu.menuLists.menuItems);
      final categories = await _localDatasource.getCachedCategories();

      return (categories, null);
    } catch (e) {
      return (<CategoryModel>[], e.toString());
    }
  }

  @override
  Future<(List<MenuItemModel>, String?)> getMenuItems() async {
    try {
      final menuItems = await _localDatasource.getCachedMenuItems();

      return (menuItems, null);
    } catch (e) {
      return (<MenuItemModel>[], e.toString());
    }
  }
}
