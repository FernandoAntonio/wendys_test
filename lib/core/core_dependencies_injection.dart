import 'package:wendys_test/core/network/http_client/entities/http_options.dart';
import 'package:wendys_test/core/network/http_client/http_client.dart';
import 'package:wendys_test/dependency_injection.dart';

Future<void> initCoreDependencies() async {
  getIt.registerLazySingleton<IHttpClient>(
    () => DefaultHttpClient(
      HttpOptions(
        baseUrl: 'api.app.tst.wendys.digital',
        requestTimeout: const Duration(seconds: 30),
      ),
    ),
  );
}
