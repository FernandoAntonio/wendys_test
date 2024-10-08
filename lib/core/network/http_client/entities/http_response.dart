import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_response.freezed.dart';

@freezed
class HttpResponse with _$HttpResponse {
  const factory HttpResponse({
    required int statusCode,
    required Map<String, dynamic> headers,
    required String body,
    required Uint8List bodyBytes,
  }) = _HttpResponse;
}
