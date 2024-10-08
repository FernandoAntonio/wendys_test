import 'dart:convert';

import 'package:wendys_test/core/network/http_client/entities/http_methods.dart';
import 'package:wendys_test/core/network/http_client/entities/http_request.dart';
import 'package:wendys_test/core/network/http_client/http_client.dart';
import 'package:wendys_test/data/models/menu/menu_model.dart';

abstract interface class IMenuRemoteDatasource {
  Future<MenuModel> getMenu();
}

class MenuRemoteDatasource implements IMenuRemoteDatasource {
  final IHttpClient _client;

  MenuRemoteDatasource({
    required IHttpClient client,
  }) : _client = client;

  @override
  Future<MenuModel> getMenu() async {
    final path = '/web-client-gateway/menu/getSiteMenu';
    final headers = {'Content-Type': 'application/json'};
    final queryParams = {
      'lang': 'en',
      'cntry': 'US',
      'sourceCode': 'ORDER.WENDYS',
      'version': '22.1.2',
      'siteNum': '0',
    };

    final request = HttpRequest(
      path: path,
      method: HttpMethod.get,
      queryParams: queryParams,
      headers: headers,
    );

    try {
      final response = await _client.sendRequest(request);
      final decodedBody = utf8.decode(response.bodyBytes.toList());
      final Map<String, dynamic> menuMap = jsonDecode(decodedBody);

      return MenuModel.fromJson(menuMap);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
