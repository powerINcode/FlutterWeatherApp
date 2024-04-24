import 'dart:convert';

import 'package:core/logger/storage/secure_storage.dart';
import 'package:data/src/services/amadeus_auth_service.dart';
import 'package:dio/dio.dart';

import '../dto/amadeus_token_dto.dart';

class AmadeusInterceptor extends Interceptor {
  AmadeusInterceptor({
    required AmadeusAuthService service,
    required SecureStorage storage,
    required String clientId,
    required String clientSecret,
  })  : _storage = storage,
        _service = service,
        _clientSecret = clientSecret,
        _clientId = clientId;

  static const _tokenKey = 'tokenKey';

  final AmadeusAuthService _service;
  final SecureStorage _storage;

  final String _clientId;
  final String _clientSecret;
  int _tokenExpireIn = 0;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _getToken().onError((error, stackTrace) {
      handler.reject(DioException(requestOptions: options, error: error));
      return null;
    });

    options.headers.addAll({'Authorization': 'Bearer $token'});

    return super.onRequest(options, handler);
  }

  Future<String?> _getToken() async {
    final tokenJson = await _storage.read(_tokenKey);
    if (tokenJson != null) {
      final token = AmadeusTokenDto.fromJson(jsonDecode(tokenJson));
      if (DateTime.now().millisecondsSinceEpoch <= _tokenExpireIn) {
        return token.accessToken;
      }
    }

    return _service
        .getAmadeusToken(
      clientId: _clientId,
      clientSecret: _clientSecret,
    )
        .then((dto) {
      _storage.write(
        key: _tokenKey,
        value: jsonEncode(dto.toJson()),
      );

      final expireIn = DateTime.now()..add(Duration(seconds: dto.expiresIn));
      _tokenExpireIn = expireIn.millisecondsSinceEpoch;

      return dto;
    }).then((dto) => dto.accessToken);
  }
}
