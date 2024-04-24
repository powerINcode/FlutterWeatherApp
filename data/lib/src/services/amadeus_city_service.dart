import 'package:data/src/dto/city_search_dto/city_search_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'amadeus_city_service.g.dart';

@RestApi()
abstract class AmadeusCityService {
  factory AmadeusCityService(Dio dio, {String baseUrl}) = _AmadeusCityService;

  @GET('/reference-data/locations')
  Future<CitySearchDto> searchCity({
    @Query('keyword') required String keyword,
    @Query('subType') String subType = 'CITY',
    @Query('view') String view = 'FULL',
    @Query('sort') String sort = 'analytics.travelers.score',
    @Query('page[limit]') int page = 100,
    @Query('page[offset]') int offset = 0,
  });
}
