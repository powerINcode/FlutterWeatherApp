import 'package:core/data/data.dart';
import 'package:domain/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    Data<List<City>>? cities,
    City? selectedCity,
    Weather? weather,
  }) = _SearchState;
}
