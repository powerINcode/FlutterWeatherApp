import 'package:domain/src/models/city.dart';

/// Repository responsible for the city operations
abstract class CityRepository {
  /// Searching [City] by the specified [query]
  Future<City> search(String query);
}
