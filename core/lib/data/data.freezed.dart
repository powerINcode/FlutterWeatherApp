// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Data<T> {
  bool get loading => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  T? get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loading, Object? error, T? value) loading,
    required TResult Function(bool loading, Object? error, T? value) error,
    required TResult Function(bool loading, Object? error, T value) value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loading, Object? error, T? value)? loading,
    TResult? Function(bool loading, Object? error, T? value)? error,
    TResult? Function(bool loading, Object? error, T value)? value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loading, Object? error, T? value)? loading,
    TResult Function(bool loading, Object? error, T? value)? error,
    TResult Function(bool loading, Object? error, T value)? value,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoading<T> value) loading,
    required TResult Function(_DataError<T> value) error,
    required TResult Function(_DataValue<T> value) value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoading<T> value)? loading,
    TResult? Function(_DataError<T> value)? error,
    TResult? Function(_DataValue<T> value)? value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoading<T> value)? loading,
    TResult Function(_DataError<T> value)? error,
    TResult Function(_DataValue<T> value)? value,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataCopyWith<T, Data<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<T, $Res> {
  factory $DataCopyWith(Data<T> value, $Res Function(Data<T>) then) =
      _$DataCopyWithImpl<T, $Res, Data<T>>;
  @useResult
  $Res call({bool loading, Object? error});
}

/// @nodoc
class _$DataCopyWithImpl<T, $Res, $Val extends Data<T>>
    implements $DataCopyWith<T, $Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataLoadingImplCopyWith<T, $Res>
    implements $DataCopyWith<T, $Res> {
  factory _$$DataLoadingImplCopyWith(_$DataLoadingImpl<T> value,
          $Res Function(_$DataLoadingImpl<T>) then) =
      __$$DataLoadingImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool loading, Object? error, T? value});
}

/// @nodoc
class __$$DataLoadingImplCopyWithImpl<T, $Res>
    extends _$DataCopyWithImpl<T, $Res, _$DataLoadingImpl<T>>
    implements _$$DataLoadingImplCopyWith<T, $Res> {
  __$$DataLoadingImplCopyWithImpl(
      _$DataLoadingImpl<T> _value, $Res Function(_$DataLoadingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? value = freezed,
  }) {
    return _then(_$DataLoadingImpl<T>(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$DataLoadingImpl<T> extends _DataLoading<T> {
  const _$DataLoadingImpl({this.loading = true, this.error, this.value})
      : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final Object? error;
  @override
  final T? value;

  @override
  String toString() {
    return 'Data<$T>.loading(loading: $loading, error: $error, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataLoadingImpl<T> &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataLoadingImplCopyWith<T, _$DataLoadingImpl<T>> get copyWith =>
      __$$DataLoadingImplCopyWithImpl<T, _$DataLoadingImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loading, Object? error, T? value) loading,
    required TResult Function(bool loading, Object? error, T? value) error,
    required TResult Function(bool loading, Object? error, T value) value,
  }) {
    return loading(this.loading, this.error, this.value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loading, Object? error, T? value)? loading,
    TResult? Function(bool loading, Object? error, T? value)? error,
    TResult? Function(bool loading, Object? error, T value)? value,
  }) {
    return loading?.call(this.loading, this.error, this.value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loading, Object? error, T? value)? loading,
    TResult Function(bool loading, Object? error, T? value)? error,
    TResult Function(bool loading, Object? error, T value)? value,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this.loading, this.error, this.value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoading<T> value) loading,
    required TResult Function(_DataError<T> value) error,
    required TResult Function(_DataValue<T> value) value,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoading<T> value)? loading,
    TResult? Function(_DataError<T> value)? error,
    TResult? Function(_DataValue<T> value)? value,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoading<T> value)? loading,
    TResult Function(_DataError<T> value)? error,
    TResult Function(_DataValue<T> value)? value,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DataLoading<T> extends Data<T> {
  const factory _DataLoading(
      {final bool loading,
      final Object? error,
      final T? value}) = _$DataLoadingImpl<T>;
  const _DataLoading._() : super._();

  @override
  bool get loading;
  @override
  Object? get error;
  @override
  T? get value;
  @override
  @JsonKey(ignore: true)
  _$$DataLoadingImplCopyWith<T, _$DataLoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataErrorImplCopyWith<T, $Res>
    implements $DataCopyWith<T, $Res> {
  factory _$$DataErrorImplCopyWith(
          _$DataErrorImpl<T> value, $Res Function(_$DataErrorImpl<T>) then) =
      __$$DataErrorImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool loading, Object? error, T? value});
}

/// @nodoc
class __$$DataErrorImplCopyWithImpl<T, $Res>
    extends _$DataCopyWithImpl<T, $Res, _$DataErrorImpl<T>>
    implements _$$DataErrorImplCopyWith<T, $Res> {
  __$$DataErrorImplCopyWithImpl(
      _$DataErrorImpl<T> _value, $Res Function(_$DataErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? value = freezed,
  }) {
    return _then(_$DataErrorImpl<T>(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$DataErrorImpl<T> extends _DataError<T> {
  const _$DataErrorImpl({this.loading = false, this.error, this.value})
      : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final Object? error;
  @override
  final T? value;

  @override
  String toString() {
    return 'Data<$T>.error(loading: $loading, error: $error, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataErrorImpl<T> &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataErrorImplCopyWith<T, _$DataErrorImpl<T>> get copyWith =>
      __$$DataErrorImplCopyWithImpl<T, _$DataErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loading, Object? error, T? value) loading,
    required TResult Function(bool loading, Object? error, T? value) error,
    required TResult Function(bool loading, Object? error, T value) value,
  }) {
    return error(this.loading, this.error, this.value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loading, Object? error, T? value)? loading,
    TResult? Function(bool loading, Object? error, T? value)? error,
    TResult? Function(bool loading, Object? error, T value)? value,
  }) {
    return error?.call(this.loading, this.error, this.value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loading, Object? error, T? value)? loading,
    TResult Function(bool loading, Object? error, T? value)? error,
    TResult Function(bool loading, Object? error, T value)? value,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.loading, this.error, this.value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoading<T> value) loading,
    required TResult Function(_DataError<T> value) error,
    required TResult Function(_DataValue<T> value) value,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoading<T> value)? loading,
    TResult? Function(_DataError<T> value)? error,
    TResult? Function(_DataValue<T> value)? value,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoading<T> value)? loading,
    TResult Function(_DataError<T> value)? error,
    TResult Function(_DataValue<T> value)? value,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _DataError<T> extends Data<T> {
  const factory _DataError(
      {final bool loading,
      final Object? error,
      final T? value}) = _$DataErrorImpl<T>;
  const _DataError._() : super._();

  @override
  bool get loading;
  @override
  Object? get error;
  @override
  T? get value;
  @override
  @JsonKey(ignore: true)
  _$$DataErrorImplCopyWith<T, _$DataErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataValueImplCopyWith<T, $Res>
    implements $DataCopyWith<T, $Res> {
  factory _$$DataValueImplCopyWith(
          _$DataValueImpl<T> value, $Res Function(_$DataValueImpl<T>) then) =
      __$$DataValueImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool loading, Object? error, T value});
}

/// @nodoc
class __$$DataValueImplCopyWithImpl<T, $Res>
    extends _$DataCopyWithImpl<T, $Res, _$DataValueImpl<T>>
    implements _$$DataValueImplCopyWith<T, $Res> {
  __$$DataValueImplCopyWithImpl(
      _$DataValueImpl<T> _value, $Res Function(_$DataValueImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? value = freezed,
  }) {
    return _then(_$DataValueImpl<T>(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DataValueImpl<T> extends _DataValue<T> {
  const _$DataValueImpl({this.loading = false, this.error, required this.value})
      : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final Object? error;
  @override
  final T value;

  @override
  String toString() {
    return 'Data<$T>.value(loading: $loading, error: $error, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataValueImpl<T> &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataValueImplCopyWith<T, _$DataValueImpl<T>> get copyWith =>
      __$$DataValueImplCopyWithImpl<T, _$DataValueImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loading, Object? error, T? value) loading,
    required TResult Function(bool loading, Object? error, T? value) error,
    required TResult Function(bool loading, Object? error, T value) value,
  }) {
    return value(this.loading, this.error, this.value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loading, Object? error, T? value)? loading,
    TResult? Function(bool loading, Object? error, T? value)? error,
    TResult? Function(bool loading, Object? error, T value)? value,
  }) {
    return value?.call(this.loading, this.error, this.value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loading, Object? error, T? value)? loading,
    TResult Function(bool loading, Object? error, T? value)? error,
    TResult Function(bool loading, Object? error, T value)? value,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this.loading, this.error, this.value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoading<T> value) loading,
    required TResult Function(_DataError<T> value) error,
    required TResult Function(_DataValue<T> value) value,
  }) {
    return value(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoading<T> value)? loading,
    TResult? Function(_DataError<T> value)? error,
    TResult? Function(_DataValue<T> value)? value,
  }) {
    return value?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoading<T> value)? loading,
    TResult Function(_DataError<T> value)? error,
    TResult Function(_DataValue<T> value)? value,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this);
    }
    return orElse();
  }
}

abstract class _DataValue<T> extends Data<T> {
  const factory _DataValue(
      {final bool loading,
      final Object? error,
      required final T value}) = _$DataValueImpl<T>;
  const _DataValue._() : super._();

  @override
  bool get loading;
  @override
  Object? get error;
  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$DataValueImplCopyWith<T, _$DataValueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
