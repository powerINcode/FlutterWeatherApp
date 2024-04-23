import 'package:core/data/data.dart';
import 'package:domain/index.dart';
import 'package:domain/src/interactors/weather_interactor.dart';

class WeatherInteractorImpl implements WeatherInteractor {
  const WeatherInteractorImpl({
    required CityRepository cityRepository,
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        _cityRepository = cityRepository;

  final CityRepository _cityRepository;
  final WeatherRepository _weatherRepository;

  @override
  Future<Data<Weather>> getWeather(City city) {
    return _weatherRepository.getWeather(lon: city.lon, lat: city.lat);
  }

  @override
  Future<Data<List<City>>> search(String query) async {
    return _cityRepository.search(query);
  }
}
