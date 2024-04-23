import 'package:data/src/dto/amadeus_token_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'amadeus_auth_service.g.dart';

@RestApi()
abstract class AmadeusAuthService {
  factory AmadeusAuthService(Dio dio, {String baseUrl}) = _AmadeusAuthService;

  @FormUrlEncoded()
  @POST('/security/oauth2/token')
  Future<AmadeusTokenDto> getAmadeusToken({
    @Field('client_id') required String clientId,
    @Field('client_secret') required String clientSecret,
    @Field('grant_type') String grantType = 'client_credentials',
  });
}
