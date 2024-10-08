import 'package:wendys_test/data/models/menu/menu_model.dart';

abstract interface class IMenuRepository {
  Future<(MenuModel, String?)> getMenu();
}
