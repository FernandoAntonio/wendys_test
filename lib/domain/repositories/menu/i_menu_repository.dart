import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';

abstract interface class IMenuRepository {
  Future<(List<CategoryModel>, String?)> getCategoriesAndCacheData();
  Future<(List<MenuItemModel>, String?)> getMenuItems();
}
