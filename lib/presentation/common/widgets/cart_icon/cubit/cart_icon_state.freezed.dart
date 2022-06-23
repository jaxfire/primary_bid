// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_icon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartIconState {
  int get itemCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartIconStateCopyWith<CartIconState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartIconStateCopyWith<$Res> {
  factory $CartIconStateCopyWith(CartIconState value, $Res Function(CartIconState) then) =
      _$CartIconStateCopyWithImpl<$Res>;

  $Res call({int itemCount});
}

/// @nodoc
class _$CartIconStateCopyWithImpl<$Res> implements $CartIconStateCopyWith<$Res> {
  _$CartIconStateCopyWithImpl(this._value, this._then);

  final CartIconState _value;

  // ignore: unused_field
  final $Res Function(CartIconState) _then;

  @override
  $Res call({
    Object? itemCount = freezed,
  }) {
    return _then(_value.copyWith(
      itemCount: itemCount == freezed
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CartIconStateCopyWith<$Res> implements $CartIconStateCopyWith<$Res> {
  factory _$$_CartIconStateCopyWith(_$_CartIconState value, $Res Function(_$_CartIconState) then) =
      __$$_CartIconStateCopyWithImpl<$Res>;

  @override
  $Res call({int itemCount});
}

/// @nodoc
class __$$_CartIconStateCopyWithImpl<$Res> extends _$CartIconStateCopyWithImpl<$Res>
    implements _$$_CartIconStateCopyWith<$Res> {
  __$$_CartIconStateCopyWithImpl(_$_CartIconState _value, $Res Function(_$_CartIconState) _then)
      : super(_value, (v) => _then(v as _$_CartIconState));

  @override
  _$_CartIconState get _value => super._value as _$_CartIconState;

  @override
  $Res call({
    Object? itemCount = freezed,
  }) {
    return _then(_$_CartIconState(
      itemCount: itemCount == freezed
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CartIconState with DiagnosticableTreeMixin implements _CartIconState {
  const _$_CartIconState({required this.itemCount});

  @override
  final int itemCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartIconState(itemCount: $itemCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartIconState'))
      ..add(DiagnosticsProperty('itemCount', itemCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartIconState &&
            const DeepCollectionEquality().equals(other.itemCount, itemCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(itemCount));

  @JsonKey(ignore: true)
  @override
  _$$_CartIconStateCopyWith<_$_CartIconState> get copyWith =>
      __$$_CartIconStateCopyWithImpl<_$_CartIconState>(this, _$identity);
}

abstract class _CartIconState implements CartIconState {
  const factory _CartIconState({required final int itemCount}) = _$_CartIconState;

  @override
  int get itemCount => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_CartIconStateCopyWith<_$_CartIconState> get copyWith => throw _privateConstructorUsedError;
}
