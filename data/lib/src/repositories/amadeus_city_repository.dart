import 'package:core/data/data.dart';
import 'package:data/src/data_executer.dart';
import 'package:data/src/dto/city_search_dto/data_dto.dart';
import 'package:data/src/services/amadeus_city_service.dart';
import 'package:domain/index.dart';

class AmadeusCityRepository implements CityRepository {
  const AmadeusCityRepository({
    required AmadeusCityService service,
  }) : _service = service;

  final AmadeusCityService _service;

  @override
  Future<Data<List<City>>> search(String query) async {
    return execute(
      _service.searchCity(keyword: query).then((result) => result.data
          .map(
            (dto) => dto.toDomain(),
          )
          .toList()),
    );
  }
}
