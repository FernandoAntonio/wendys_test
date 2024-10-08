import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/domain/use_cases/categories/get_categories_use_case.dart';

Future<void> initUseCases() async {
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(repository: getIt()),
  );
}
