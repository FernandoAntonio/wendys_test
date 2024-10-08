import 'package:freezed_annotation/freezed_annotation.dart';

import 'http_methods.dart';

part 'http_request.freezed.dart';

@freezed
class HttpRequest with _$HttpRequest {
  const factory HttpRequest({
    required String path,
    required HttpMethod method,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
    Map<String, dynamic>? body,
  }) = _HttpRequest;
}
