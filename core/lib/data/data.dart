import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';

/// Represent asynchronic loading value
/// loading - represent loading state it can also contain an cached [value]
/// error - represent error of [value] loading
/// value - represent successfully loaded [value]
@freezed
class Data<T> with _$Data<T> {
  const Data._();

  const factory Data.loading({
    @Default(true) bool loading,
    Object? error,
    T? value,
  }) = _DataLoading;

  const factory Data.error({
    @Default(false) bool loading,
    Object? error,
    T? value,
  }) = _DataError;

  const factory Data.value({
    @Default(false) bool loading,
    Object? error,
    required T value,
  }) = _DataValue;

  bool get loading => this is _DataLoading;
  bool get hasError => this is _DataError && error != null;
  bool get ready => !loading && !hasError;
}
