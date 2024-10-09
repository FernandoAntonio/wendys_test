import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/domain/use_cases/categories/get_categories_use_case.dart';
import 'package:wendys_test/domain/use_cases/menu_items/get_menu_items_by_id_use_case.dart';

Future<void> initUseCases() async {
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetMenuItemsByIdUseCase>(
    () => GetMenuItemsByIdUseCase(repository: getIt()),
  );
}
