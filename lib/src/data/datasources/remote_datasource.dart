import 'package:http/http.dart' as http show get;
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
    final rawResponse = await http.get(Uri(
      path: url,
      queryParameters: queryParameters,
    ));

    return CoreResponse(
      data: rawResponse.body,
      statusCode: rawResponse.statusCode,
    );
  }
}
