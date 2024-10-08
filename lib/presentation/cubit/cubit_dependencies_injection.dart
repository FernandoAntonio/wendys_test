import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';

Future<void> initCubits() async {
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getCategoriesUseCase: getIt()),
  );
}
