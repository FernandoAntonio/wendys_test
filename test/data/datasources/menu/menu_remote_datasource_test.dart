import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/core/network/http_client/entities/http_response.dart';
import 'package:wendys_test/core/network/http_client/http_client.dart';
import 'package:wendys_test/data/datasources/menu/menu_remote_datasource.dart';
import 'package:wendys_test/data/models/menu/menu_model.dart';

import '../../../fixtures/fixture_reader.dart';
import 'menu_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IHttpClient>()])
void main() {
  late MockIHttpClient mockClient;
  late MenuRemoteDatasource remoteDatasource;

  setUp(() {
    mockClient = MockIHttpClient();
    remoteDatasource = MenuRemoteDatasource(client: mockClient);
  });

  group('MenuRemoteDatasource', () {
    final headers = {'Content-Type': 'application/json'};
    final mockMenuString = fixture('menu');

    group('getMenu', () {
      test('should return a MenuModel when the call is successful', () async {
        // Arrange
        final mockResponse = HttpResponse(
          statusCode: 200,
          bodyBytes: utf8.encode(mockMenuString),
          body: mockMenuString,
          headers: headers,
        );

        when(mockClient.sendRequest(any)).thenAnswer((_) async => mockResponse);

        // Act
        final result = await remoteDatasource.getMenu();

        // Assert
        expect(result, isA<MenuModel>());
        verify(mockClient.sendRequest(any)).called(1);
      });

      test('should throw an exception when the call is unsuccessful', () async {
        // Arrange
        when(mockClient.sendRequest(any)).thenThrow(Exception('Network error'));

        // Act
        final call = remoteDatasource.getMenu();

        // Assert
        expect(call, throwsException);
        verify(mockClient.sendRequest(any)).called(1);
      });
    });
  });
}
