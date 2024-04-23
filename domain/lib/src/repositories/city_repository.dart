import 'package:domain/src/models/city.dart';
import 'package:core/data/data.dart';

/// Repository responsible for the city operations
abstract class CityRepository {
  /// Searching a list of [City] by the specified [query]
  Future<Data<List<City>>> search(String query);
}
