import 'dart:convert';

import 'package:data/src/services/amadeus_city_service.dart';
import 'package:dio/dio.dart';
import 'package:get_secure_storage/get_secure_storage.dart';

import '../dto/amadeus_token_dto.dart';

class AmadeusInterceptor extends Interceptor {
  const AmadeusInterceptor({
    required AmadeusCityService service,
    required GetSecureStorage storage,
    required String clientId,
    required String clientSecret,
  })  : _storage = storage,
        _service = service,
        _clientSecret = clientSecret,
        _clientId = clientId;

  static const tokenKey = 'tokenKey';

  final AmadeusCityService _service;
  final GetSecureStorage _storage;

  final String _clientId;
  final String _clientSecret;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _getToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});

    return super.onRequest(options, handler);
  }

  Future<String?> _getToken() async {
    final tokenJson = _storage.read(tokenKey);
    if (tokenJson != null) {
      final token = AmadeusTokenDto.fromJson(jsonDecode(tokenJson));
      if (token.expiresIn < DateTime.now().millisecondsSinceEpoch) {
        return token.accessToken;
      }
    }

    return _service
        .getToken(
      clientId: _clientId,
      clientSecret: _clientSecret,
    )
        .then((dto) {
      _storage.write(tokenKey, dto.toJson());

      return dto;
    }).then((dto) => dto.accessToken);
  }
}
