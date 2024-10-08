import 'package:wendys_test/core/use_cases/i_use_case.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/domain/repositories/menu/i_menu_repository.dart';

class GetCategoriesUseCase implements IUseCase<List<CategoryModel>, NoParams> {
  final IMenuRepository _repository;

  const GetCategoriesUseCase({
    required IMenuRepository repository,
  }) : _repository = repository;

  @override
  Future<(List<CategoryModel>, String?)> call(params) async {
    final (menu, error) = await _repository.getMenu();
    return (menu.menuLists.categories, error);
  }
}
