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
  @override
  Future<CoreResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final dioResponse = await Dio().get(url);

    return CoreResponse(
      data: dioResponse.data,
      hasError: dioResponse.data['erro'] == 'true',
    );
  }
}
