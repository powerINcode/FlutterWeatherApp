import 'package:dio/dio.dart';

class OpenWeatherInterceptor extends Interceptor {
  const OpenWeatherInterceptor({
    required String apiKey,
  }) : _apiKey = apiKey;

  final String _apiKey;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters.addAll({'appid': _apiKey});

    return super.onRequest(options, handler);
  }
}
