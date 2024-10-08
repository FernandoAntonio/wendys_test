import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';

Future<void> initCubits() async {
  getIt.registerLazySingleton<CategoriesCubit>(
    () => CategoriesCubit(getCategoriesUseCase: getIt()),
  );
}
