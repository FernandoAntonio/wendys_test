import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/core/network/http_client/entities/http_methods.dart';
import 'package:wendys_test/core/network/http_client/entities/http_options.dart';
import 'package:wendys_test/core/network/http_client/entities/http_request.dart';
import 'package:wendys_test/core/network/http_client/http_client.dart';

import 'http_client_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  late DefaultHttpClient httpClient;
  late MockClient mockHttpClient;

  setUp(() {
    final options = HttpOptions(
      baseUrl: 'api.app.tst.wendys.digital',
      requestTimeout: Duration(seconds: 30),
    );
    mockHttpClient = MockClient();
    httpClient = DefaultHttpClient(options, httpClient: mockHttpClient);
  });

  group('DefaultHttpClient', () {
    final error = Exception('Error Message');
    final headers = {'Content-Type': 'application/json'};
    final responseBody = '{"key": "value"}';

    test('should return a HttpResponse when the GET request is successful', () async {
      // Arrange
      final request = HttpRequest(path: '/test', method: HttpMethod.get);

      final mockResponse = http.Response(responseBody, 200, headers: headers);
      when(mockHttpClient.get(any)).thenAnswer((_) async => mockResponse);

      // Act
      final response = await httpClient.sendRequest(request);

      // Assert
      expect(response.statusCode, 200);
      expect(response.body, jsonEncode(responseBody));
      expect(response.headers, headers);
      expect(response.bodyBytes, utf8.encode(responseBody));
    });

    test('should return a HttpResponse when the POST request is successful', () async {
      // Arrange
      final request = HttpRequest(path: '/test', method: HttpMethod.post);

      final mockResponse = http.Response(responseBody, 200, headers: headers);
      when(mockHttpClient.post(any)).thenAnswer((_) async => mockResponse);

      // Act
      final response = await httpClient.sendRequest(request);

      // Assert
      expect(response.statusCode, 200);
      expect(response.body, jsonEncode(responseBody));
      expect(response.headers, headers);
      expect(response.bodyBytes, utf8.encode(responseBody));
    });

    test('should return a HttpResponse when the PUT request is successful', () async {
      // Arrange
      final request = HttpRequest(path: '/test', method: HttpMethod.put);

      final mockResponse = http.Response(responseBody, 200, headers: headers);
      when(mockHttpClient.put(any)).thenAnswer((_) async => mockResponse);

      // Act
      final response = await httpClient.sendRequest(request);

      // Assert
      expect(response.statusCode, 200);
      expect(response.body, jsonEncode(responseBody));
      expect(response.headers, headers);
      expect(response.bodyBytes, utf8.encode(responseBody));
    });

    test('should return a HttpResponse when the PATCH request is successful', () async {
      // Arrange
      final request = HttpRequest(path: '/test', method: HttpMethod.patch);

      final mockResponse = http.Response(responseBody, 200, headers: headers);
      when(mockHttpClient.patch(any)).thenAnswer((_) async => mockResponse);

      // Act
      final response = await httpClient.sendRequest(request);

      // Assert
      expect(response.statusCode, 200);
      expect(response.body, jsonEncode(responseBody));
      expect(response.headers, headers);
      expect(response.bodyBytes, utf8.encode(responseBody));
    });

    test('should return a HttpResponse when the DELETE request is successful', () async {
      // Arrange
      final request = HttpRequest(path: '/test', method: HttpMethod.delete);

      final mockResponse = http.Response(responseBody, 200, headers: headers);
      when(mockHttpClient.delete(any)).thenAnswer((_) async => mockResponse);

      // Act
      final response = await httpClient.sendRequest(request);

      // Assert
      expect(response.statusCode, 200);
      expect(response.body, jsonEncode(responseBody));
      expect(response.headers, headers);
      expect(response.bodyBytes, utf8.encode(responseBody));
    });

    test('should throw an exception when the request fails', () async {
      // Arrange
      final request = HttpRequest(path: '/test', method: HttpMethod.get);
      when(mockHttpClient.get(any)).thenThrow(error);

      // Act & Assert
      expect(() async => await httpClient.sendRequest(request), throwsException);
    });
  });
}
