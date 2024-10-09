import 'dart:convert';

import 'package:wendys_test/core/local_storage/entities/local_storage_keys.dart';
import 'package:wendys_test/core/local_storage/local_storage.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';

abstract interface class IMenuLocalDatasource {
  Future<void> storeCategories(List<CategoryModel> categories);
  Future<void> storeMenuItems(List<MenuItemModel> menuItems);
  Future<List<CategoryModel>> getCachedCategories();
  Future<List<MenuItemModel>> getCachedMenuItems();
}

class MenuLocalDatasource implements IMenuLocalDatasource {
  final ILocalStorage _localStorage;

  MenuLocalDatasource({
    required ILocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<List<CategoryModel>> getCachedCategories() async {
    final String? categoriesString = await _localStorage.read(LocalStorageKeys.categories);

    if (categoriesString != null) {
      final List categoriesJsonList = jsonDecode(categoriesString);
      return List.generate(
        categoriesJsonList.length,
        (index) => CategoryModel.fromJson(categoriesJsonList.elementAt(index)),
      );
    }
    return [];
  }

  @override
  Future<List<MenuItemModel>> getCachedMenuItems() async {
    final String? menuItemsString = await _localStorage.read(LocalStorageKeys.menuItems);

    if (menuItemsString != null) {
      final List menuItemsJsonList = jsonDecode(menuItemsString);
      return List.generate(
        menuItemsJsonList.length,
        (index) => MenuItemModel.fromJson(menuItemsJsonList.elementAt(index)),
      );
    }
    return [];
  }

  @override
  Future<void> storeCategories(List<CategoryModel> categories) async {
    final categoriesJson = categories.map((e) => e.toJson()).toList();
    final categoriesString = jsonEncode(categoriesJson);
    await _localStorage.write(LocalStorageKeys.categories, categoriesString);
  }

  @override
  Future<void> storeMenuItems(List<MenuItemModel> menuItems) async {
    final categoriesJson = menuItems.map((e) => e.toJson()).toList();
    final categoriesString = jsonEncode(categoriesJson);
    await _localStorage.write(LocalStorageKeys.menuItems, categoriesString);
  }
}
