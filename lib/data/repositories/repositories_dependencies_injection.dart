import 'package:wendys_test/data/repositories/menu/menu_repository.dart';
import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/domain/repositories/menu/i_menu_repository.dart';

Future<void> initRepositories() async {
  getIt.registerLazySingleton<IMenuRepository>(
    () => MenuRepository(remoteDatasource: getIt()),
  );
}
