// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductListState {
  bool get isLoading => throw _privateConstructorUsedError;

  bool get isNetworkFailure => throw _privateConstructorUsedError;

  bool get isOtherFailure => throw _privateConstructorUsedError; // TODO: Change to unexpected error?
  List<Product> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductListStateCopyWith<ProductListState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListStateCopyWith<$Res> {
  factory $ProductListStateCopyWith(ProductListState value, $Res Function(ProductListState) then) =
      _$ProductListStateCopyWithImpl<$Res>;

  $Res call({bool isLoading, bool isNetworkFailure, bool isOtherFailure, List<Product> data});
}

/// @nodoc
class _$ProductListStateCopyWithImpl<$Res> implements $ProductListStateCopyWith<$Res> {
  _$ProductListStateCopyWithImpl(this._value, this._then);

  final ProductListState _value;

  // ignore: unused_field
  final $Res Function(ProductListState) _then;

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
              as List<Product>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductListStateCopyWith<$Res> implements $ProductListStateCopyWith<$Res> {
  factory _$$_ProductListStateCopyWith(_$_ProductListState value, $Res Function(_$_ProductListState) then) =
      __$$_ProductListStateCopyWithImpl<$Res>;

  @override
  $Res call({bool isLoading, bool isNetworkFailure, bool isOtherFailure, List<Product> data});
}

/// @nodoc
class __$$_ProductListStateCopyWithImpl<$Res> extends _$ProductListStateCopyWithImpl<$Res>
    implements _$$_ProductListStateCopyWith<$Res> {
  __$$_ProductListStateCopyWithImpl(_$_ProductListState _value, $Res Function(_$_ProductListState) _then)
      : super(_value, (v) => _then(v as _$_ProductListState));

  @override
  _$_ProductListState get _value => super._value as _$_ProductListState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isNetworkFailure = freezed,
    Object? isOtherFailure = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ProductListState(
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
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_ProductListState with DiagnosticableTreeMixin implements _ProductListState {
  const _$_ProductListState(
      {required this.isLoading,
      required this.isNetworkFailure,
      required this.isOtherFailure,
      required final List<Product> data})
      : _data = data;

  @override
  final bool isLoading;
  @override
  final bool isNetworkFailure;
  @override
  final bool isOtherFailure;

// TODO: Change to unexpected error?
  final List<Product> _data;

// TODO: Change to unexpected error?
  @override
  List<Product> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductListState(isLoading: $isLoading, isNetworkFailure: $isNetworkFailure, isOtherFailure: $isOtherFailure, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductListState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isNetworkFailure', isNetworkFailure))
      ..add(DiagnosticsProperty('isOtherFailure', isOtherFailure))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductListState &&
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
  _$$_ProductListStateCopyWith<_$_ProductListState> get copyWith =>
      __$$_ProductListStateCopyWithImpl<_$_ProductListState>(this, _$identity);
}

abstract class _ProductListState implements ProductListState {
  const factory _ProductListState(
      {required final bool isLoading,
      required final bool isNetworkFailure,
      required final bool isOtherFailure,
      required final List<Product> data}) = _$_ProductListState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;

  @override
  bool get isNetworkFailure => throw _privateConstructorUsedError;

  @override
  bool get isOtherFailure => throw _privateConstructorUsedError;

  @override // TODO: Change to unexpected error?
  List<Product> get data => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_ProductListStateCopyWith<_$_ProductListState> get copyWith => throw _privateConstructorUsedError;
}
