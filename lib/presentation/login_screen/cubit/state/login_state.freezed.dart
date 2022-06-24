// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get failureMessage => throw _privateConstructorUsedError;
  String get invalidUsernameMessage => throw _privateConstructorUsedError;
  String get invalidPasswordMessage => throw _privateConstructorUsedError;
  String get navigateTo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String failureMessage,
      String invalidUsernameMessage,
      String invalidPasswordMessage,
      String navigateTo});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failureMessage = freezed,
    Object? invalidUsernameMessage = freezed,
    Object? invalidPasswordMessage = freezed,
    Object? navigateTo = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureMessage: failureMessage == freezed
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
      invalidUsernameMessage: invalidUsernameMessage == freezed
          ? _value.invalidUsernameMessage
          : invalidUsernameMessage // ignore: cast_nullable_to_non_nullable
              as String,
      invalidPasswordMessage: invalidPasswordMessage == freezed
          ? _value.invalidPasswordMessage
          : invalidPasswordMessage // ignore: cast_nullable_to_non_nullable
              as String,
      navigateTo: navigateTo == freezed
          ? _value.navigateTo
          : navigateTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      String failureMessage,
      String invalidUsernameMessage,
      String invalidPasswordMessage,
      String navigateTo});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, (v) => _then(v as _$_LoginState));

  @override
  _$_LoginState get _value => super._value as _$_LoginState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failureMessage = freezed,
    Object? invalidUsernameMessage = freezed,
    Object? invalidPasswordMessage = freezed,
    Object? navigateTo = freezed,
  }) {
    return _then(_$_LoginState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureMessage: failureMessage == freezed
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
      invalidUsernameMessage: invalidUsernameMessage == freezed
          ? _value.invalidUsernameMessage
          : invalidUsernameMessage // ignore: cast_nullable_to_non_nullable
              as String,
      invalidPasswordMessage: invalidPasswordMessage == freezed
          ? _value.invalidPasswordMessage
          : invalidPasswordMessage // ignore: cast_nullable_to_non_nullable
              as String,
      navigateTo: navigateTo == freezed
          ? _value.navigateTo
          : navigateTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginState with DiagnosticableTreeMixin implements _LoginState {
  const _$_LoginState(
      {required this.isLoading,
      required this.failureMessage,
      required this.invalidUsernameMessage,
      required this.invalidPasswordMessage,
      required this.navigateTo});

  @override
  final bool isLoading;
  @override
  final String failureMessage;
  @override
  final String invalidUsernameMessage;
  @override
  final String invalidPasswordMessage;
  @override
  final String navigateTo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState(isLoading: $isLoading, failureMessage: $failureMessage, invalidUsernameMessage: $invalidUsernameMessage, invalidPasswordMessage: $invalidPasswordMessage, navigateTo: $navigateTo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('failureMessage', failureMessage))
      ..add(
          DiagnosticsProperty('invalidUsernameMessage', invalidUsernameMessage))
      ..add(
          DiagnosticsProperty('invalidPasswordMessage', invalidPasswordMessage))
      ..add(DiagnosticsProperty('navigateTo', navigateTo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.failureMessage, failureMessage) &&
            const DeepCollectionEquality()
                .equals(other.invalidUsernameMessage, invalidUsernameMessage) &&
            const DeepCollectionEquality()
                .equals(other.invalidPasswordMessage, invalidPasswordMessage) &&
            const DeepCollectionEquality()
                .equals(other.navigateTo, navigateTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(failureMessage),
      const DeepCollectionEquality().hash(invalidUsernameMessage),
      const DeepCollectionEquality().hash(invalidPasswordMessage),
      const DeepCollectionEquality().hash(navigateTo));

  @JsonKey(ignore: true)
  @override
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {required final bool isLoading,
      required final String failureMessage,
      required final String invalidUsernameMessage,
      required final String invalidPasswordMessage,
      required final String navigateTo}) = _$_LoginState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String get failureMessage => throw _privateConstructorUsedError;
  @override
  String get invalidUsernameMessage => throw _privateConstructorUsedError;
  @override
  String get invalidPasswordMessage => throw _privateConstructorUsedError;
  @override
  String get navigateTo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
