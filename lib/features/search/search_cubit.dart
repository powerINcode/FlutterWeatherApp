import 'package:core/data/data.dart';
import 'package:domain/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/features/search/search_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required WeatherInteractor interactor,
  })  : _interactor = interactor,
        super(const SearchState());

  final WeatherInteractor _interactor;

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
          .switchMap((query) => _interactor.search(query).asStream())
          .listen((data) {
            emit(state.copyWith(
              cities: data,
              selectedCity: null,
              weather: null,
            ));
          }),
    );
  }

  @override
  Future<void> close() {
    _compositeSubscription.dispose();
    return super.close();
  }

  void search(String query) {
    _querySubject.add(query);
  }

  Future<void> selectCity(City city) async {
    final wather = await _interactor.getWeather(city);
    emit(state.copyWith(
      selectedCity: city,
      weather: wather.value,
    ));
  }
}
