import 'package:domain/src/models/city.dart';

/// Repository responsible for the city operations
abstract class CityRepository {
  /// Searching a list of [City] by the specified [query]
  Future<List<City>> search(String query);
}
