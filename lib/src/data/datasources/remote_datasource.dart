import 'package:dio/dio.dart';
import 'package:konsi_challenge/src/core/resources/core_response.dart';

abstract class HttpGet {
  Future<CoreResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  });
}

abstract class RemoteDatasourceInterface implements HttpGet {}

class RemoteDatasource implements RemoteDatasourceInterface {
  final Dio _dio;

  RemoteDatasource(this._dio);

  @override
  Future<CoreResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final dioResponse = await _dio.get(url);

    return CoreResponse(
      data: dioResponse.data,
      hasError: dioResponse.data['erro'] == 'true',
    );
  }
}
