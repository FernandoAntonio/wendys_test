import 'package:wendys_test/data/datasources/menu/menu_remote_datasource.dart';
import 'package:wendys_test/dependency_injection.dart';

Future<void> initDatasources() async {
  getIt.registerLazySingleton<IMenuRemoteDatasource>(
    () => MenuRemoteDatasource(client: getIt()),
  );
}
