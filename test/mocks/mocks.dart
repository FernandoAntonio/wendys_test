import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wendys_test/core/local_storage/local_storage.dart';
import 'package:wendys_test/core/network/http_client/http_client.dart';
import 'package:wendys_test/data/datasources/menu/menu_local_datasource.dart';
import 'package:wendys_test/data/datasources/menu/menu_remote_datasource.dart';
import 'package:wendys_test/domain/repositories/menu/i_menu_repository.dart';

@GenerateNiceMocks([
  MockSpec<IMenuRepository>(),
  MockSpec<IMenuLocalDatasource>(),
  MockSpec<IMenuRemoteDatasource>(),
  MockSpec<ILocalStorage>(),
  MockSpec<http.Client>(),
  MockSpec<SharedPreferences>(),
  MockSpec<IHttpClient>(),
])
void main() {}
