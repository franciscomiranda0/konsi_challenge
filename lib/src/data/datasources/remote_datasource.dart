import 'package:konsi_challenge/src/core/resources/response.dart';

abstract class HttpGet {
  Future<CoreResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  });
}

abstract class RemoteDatasourceInterface implements HttpGet {}

class RemoteDatasource implements RemoteDatasourceInterface {
  @override
  Future<CoreResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    throw UnimplementedError();
  }
}
