import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wendys_test/core/local_storage/local_storage.dart';
import 'package:wendys_test/core/network/http_client/http_client.dart';
import 'package:wendys_test/data/datasources/menu/menu_local_datasource.dart';
import 'package:wendys_test/data/datasources/menu/menu_remote_datasource.dart';
import 'package:wendys_test/domain/repositories/menu/i_menu_repository.dart';
import 'package:wendys_test/domain/use_cases/categories/get_categories_use_case.dart';
import 'package:wendys_test/domain/use_cases/menu_items/get_menu_items_by_id_use_case.dart';
import 'package:wendys_test/presentation/cubit/cart/cart_cubit.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';
import 'package:wendys_test/presentation/cubit/menu_items/menu_items_cubit.dart';

@GenerateNiceMocks([
  MockSpec<IMenuRepository>(),
  MockSpec<IMenuLocalDatasource>(),
  MockSpec<IMenuRemoteDatasource>(),
  MockSpec<ILocalStorage>(),
  MockSpec<http.Client>(),
  MockSpec<SharedPreferences>(),
  MockSpec<IHttpClient>(),
  MockSpec<GetCategoriesUseCase>(),
  MockSpec<GetMenuItemsByIdUseCase>(),
  MockSpec<CategoriesCubit>(),
  MockSpec<MenuItemsCubit>(),
  MockSpec<CartCubit>(),
  MockSpec<NavigatorObserver>(),
])
void main() {}
