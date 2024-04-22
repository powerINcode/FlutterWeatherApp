import 'package:data/src/dto/amadeus_token_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @FormUrlEncoded()
  @POST('https://test.api.amadeus.com/v1/reference-data/security/oauth2/token')
  Future<AmadeusTokenDto> getAmadeusToken({
    @Field('client_id') required String clientId,
    @Field('client_secret') required String clientSecret,
    @Field('grant_type') String grantType = 'client_credentials',
  });
}
