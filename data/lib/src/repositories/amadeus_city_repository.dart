import 'package:data/src/dto/city_search_dto/address_dto.dart';
import 'package:data/src/services/amadeus_city_service.dart';
import 'package:domain/index.dart';

class AmadeusCityRepository implements CityRepository {
  const AmadeusCityRepository({
    required AmadeusCityService service,
  }) : _service = service;

  final AmadeusCityService _service;

  @override
  Future<List<City>> search(String query) async {
    return _service.searchCity(keyword: query).then((result) => result.data
        .map(
          (dto) => dto.address.toDomain(),
        )
        .toList());
  }
}
