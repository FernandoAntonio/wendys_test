import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';
import 'package:wendys_test/presentation/cubit/menu_items/menu_items_cubit.dart';

Future<void> initCubits() async {
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getCategoriesUseCase: getIt()),
  );
  getIt.registerFactory<MenuItemsCubit>(
    () => MenuItemsCubit(getMenuItemsByIdUseCase: getIt()),
  );
}
