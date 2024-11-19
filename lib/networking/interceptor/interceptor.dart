import 'package:http/http.dart' as http;

import '../config.dart';

class HttpClientWithInterceptor extends http.BaseClient {
  final http.Client _inner;

  HttpClientWithInterceptor(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // print('Request: ${request.url}');
    // print('Request headers: ${request.headers}');
    // print('Request headers: ${request.method}');
    String requestEndpoint = request.url.path.toString();
    if(requestEndpoint != '/api/v1/authenticate' && requestEndpoint != '/api/v1/register') {
      request.headers['Authorization'] = Config.accessToken;
    }
    final response = await _inner.send(request);
    // Intercept response after receiving it
    // print('Response status: ${response.statusCode}');
    // print('Response headers: ${response.headers}');
    return response;
  }
}
