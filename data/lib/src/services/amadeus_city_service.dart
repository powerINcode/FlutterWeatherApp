import 'package:data/src/dto/amadeus_token_dto.dart';
import 'package:data/src/dto/city_search_dto/city_search_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'amadeus_city_service.g.dart';

@RestApi(baseUrl: 'https://test.api.amadeus.com/v1/reference-data/')
abstract class AmadeusCityService {
  factory AmadeusCityService(Dio dio, {String baseUrl}) = _AmadeusCityService;

  @GET('/locations')
  Future<CitySearchDto> searchCity({
    @Query('keyword') required String keyword,
    @Query('subType') String subType = 'CITY',
    @Query('view') String view = 'FULL',
    @Query('sort') String sort = 'analytics.travelers.score',
    @Query('page[limit]') int page = 1,
    @Query('page[offset]') int offset = 0,
  });

  @FormUrlEncoded()
  @POST('/security/oauth2/token')
  Future<AmadeusTokenDto> getToken({
    @Field('client_id') required String clientId,
    @Field('client_secret') required String clientSecret,
    @Field('grant_type') String grantType = 'client_credentials',
  });
}
