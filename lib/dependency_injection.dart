import 'package:get_it/get_it.dart';
import 'package:wendys_test/core/core_dependencies_injection.dart';
import 'package:wendys_test/data/datasources/datasources_dependencies_injection.dart';
import 'package:wendys_test/data/repositories/repositories_dependencies_injection.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  await initCoreDependencies();
  await initDatasources();
  await initRepositories();
}
