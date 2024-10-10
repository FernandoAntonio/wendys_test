import 'package:wendys_test/data/models/menu/menu_model.dart';
import 'package:wendys_test/data/models/menu_lists/menu_lists_model.dart';

import '../categories/categories_model_list_mock.dart';
import '../menu_items/menu_items_model_list_mock.dart';

final mockMenuModel = MenuModel(
  menuLists: MenuListsModel(
    menuItems: mockMenuItemsModelList,
    categories: mockCategoriesModelList,
  ),
);
