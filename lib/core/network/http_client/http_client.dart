import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wendys_test/core/network/http_client/entities/http_methods.dart';
import 'package:wendys_test/core/network/http_client/entities/http_options.dart';
import 'package:wendys_test/core/network/http_client/entities/http_request.dart';
import 'package:wendys_test/core/network/http_client/entities/http_response.dart';

abstract interface class IHttpClient {
  final HttpOptions _options;

  IHttpClient(HttpOptions options) : _options = options;

  Future<HttpResponse> sendRequest(HttpRequest request);
}

class DefaultHttpClient extends IHttpClient {
  final http.Client _httpClient;

  DefaultHttpClient(
    super.options, {
    required http.Client httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<HttpResponse> sendRequest(HttpRequest request) async {
    final Uri uri = Uri.https(
      _options.baseUrl,
      request.path,
      request.queryParams,
    );

    final Map<HttpMethod, Future Function()> handlers = {
      HttpMethod.get: () => _httpClient.get(uri),
      HttpMethod.post: () => _httpClient.post(uri, body: request.body),
      HttpMethod.put: () => _httpClient.put(uri, body: request.body),
      HttpMethod.patch: () => _httpClient.patch(uri, body: request.body),
      HttpMethod.delete: () => _httpClient.delete(uri, body: request.body),
    };

    try {
      final http.Response response = await handlers[request.method]!.call();

      return handleResponse(response);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  HttpResponse handleResponse(http.Response response) {
    final HttpResponse finalResponse = HttpResponse(
      statusCode: response.statusCode,
      body: jsonEncode(response.body),
      headers: response.headers,
      bodyBytes: response.bodyBytes,
    );

    return finalResponse;
  }
}
