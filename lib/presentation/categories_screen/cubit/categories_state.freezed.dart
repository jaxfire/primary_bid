// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;

  bool get isNetworkFailure => throw _privateConstructorUsedError;

  bool get isOtherFailure => throw _privateConstructorUsedError;

  List<String> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoriesStateCopyWith<CategoriesState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res>;

  $Res call({bool isLoading, bool isNetworkFailure, bool isOtherFailure, List<String> data});
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res> implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  final CategoriesState _value;

  // ignore: unused_field
  final $Res Function(CategoriesState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isNetworkFailure = freezed,
    Object? isOtherFailure = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNetworkFailure: isNetworkFailure == freezed
          ? _value.isNetworkFailure
          : isNetworkFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isOtherFailure: isOtherFailure == freezed
          ? _value.isOtherFailure
          : isOtherFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoriesStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$$_CategoriesStateCopyWith(_$_CategoriesState value, $Res Function(_$_CategoriesState) then) =
      __$$_CategoriesStateCopyWithImpl<$Res>;

  @override
  $Res call({bool isLoading, bool isNetworkFailure, bool isOtherFailure, List<String> data});
}

/// @nodoc
class __$$_CategoriesStateCopyWithImpl<$Res> extends _$CategoriesStateCopyWithImpl<$Res>
    implements _$$_CategoriesStateCopyWith<$Res> {
  __$$_CategoriesStateCopyWithImpl(_$_CategoriesState _value, $Res Function(_$_CategoriesState) _then)
      : super(_value, (v) => _then(v as _$_CategoriesState));

  @override
  _$_CategoriesState get _value => super._value as _$_CategoriesState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isNetworkFailure = freezed,
    Object? isOtherFailure = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_CategoriesState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNetworkFailure: isNetworkFailure == freezed
          ? _value.isNetworkFailure
          : isNetworkFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isOtherFailure: isOtherFailure == freezed
          ? _value.isOtherFailure
          : isOtherFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_CategoriesState with DiagnosticableTreeMixin implements _CategoriesState {
  const _$_CategoriesState(
      {required this.isLoading,
      required this.isNetworkFailure,
      required this.isOtherFailure,
      required final List<String> data})
      : _data = data;

  @override
  final bool isLoading;
  @override
  final bool isNetworkFailure;
  @override
  final bool isOtherFailure;
  final List<String> _data;

  @override
  List<String> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoriesState(isLoading: $isLoading, isNetworkFailure: $isNetworkFailure, isOtherFailure: $isOtherFailure, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoriesState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isNetworkFailure', isNetworkFailure))
      ..add(DiagnosticsProperty('isOtherFailure', isOtherFailure))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoriesState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isNetworkFailure, isNetworkFailure) &&
            const DeepCollectionEquality().equals(other.isOtherFailure, isOtherFailure) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isNetworkFailure),
      const DeepCollectionEquality().hash(isOtherFailure),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_CategoriesStateCopyWith<_$_CategoriesState> get copyWith =>
      __$$_CategoriesStateCopyWithImpl<_$_CategoriesState>(this, _$identity);
}

abstract class _CategoriesState implements CategoriesState {
  const factory _CategoriesState(
      {required final bool isLoading,
      required final bool isNetworkFailure,
      required final bool isOtherFailure,
      required final List<String> data}) = _$_CategoriesState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;

  @override
  bool get isNetworkFailure => throw _privateConstructorUsedError;

  @override
  bool get isOtherFailure => throw _privateConstructorUsedError;

  @override
  List<String> get data => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_CategoriesStateCopyWith<_$_CategoriesState> get copyWith => throw _privateConstructorUsedError;
}
