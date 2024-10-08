import 'package:get_it/get_it.dart';
import 'package:wendys_test/core/core_dependencies_injection.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  await initCoreDependencies();
}
