import 'package:core/data/data.dart';
import 'package:core/logger/logger.dart';
import 'package:domain/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/features/search/search_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required Logger logger,
    required WeatherInteractor weatherInteractor,
  })  : _weatherInteractor = weatherInteractor,
        _logger = logger,
        super(const SearchState());

  final WeatherInteractor _weatherInteractor;
  final Logger _logger;

  final PublishSubject<String> _querySubject = PublishSubject();
  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  Future<void> init() async {
    _compositeSubscription.add(
      _querySubject
          .debounceTime(const Duration(milliseconds: 250))
          .doOnData((_) {
            emit(
              state.copyWith(
                cities: Data.loading(value: state.cities?.value),
              ),
            );
          })
          .switchMap((query) => _weatherInteractor.search(query).asStream())
          .listen((data) {
            emit(state.copyWith(
              cities: data,
              selectedCity: null,
              weather: null,
            ));
          }),
    );

    _logger.debug('Search cubit inited');
  }

  @override
  Future<void> close() {
    _compositeSubscription.dispose();
    return super.close();
  }

  void search(String query) {
    _logger.debug('Search citiesy by query $query');
    _querySubject.add(query);
  }

  Future<void> selectCity(City city) async {
    _logger.debug('Select ${city.cityName} city');
    final weather = await _weatherInteractor.getWeather(city);
    _logger.debug('Weather is $weather');
    emit(state.copyWith(
      selectedCity: city,
      weather: weather.value,
    ));
  }
}
