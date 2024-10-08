import 'package:wendys_test/data/datasources/menu/menu_remote_datasource.dart';
import 'package:wendys_test/data/models/menu/menu_model.dart';
import 'package:wendys_test/domain/repositories/menu/i_menu_repository.dart';

class MenuRepository implements IMenuRepository {
  final IMenuRemoteDatasource _remoteDatasource;

  const MenuRepository({
    required IMenuRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<(MenuModel, String?)> getMenu() async {
    try {
      final menu = await _remoteDatasource.getMenu();

      return (menu, null);
    } catch (e) {
      return (MenuModel.empty(), e.toString());
    }
  }
}
