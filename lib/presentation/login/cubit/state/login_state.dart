import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,//
    required bool isAuthFailure,//
    required bool isNetworkFailure,//
    required bool isOtherFailure,//
    required bool showInvalidUsernameMessage,//
    required String invalidUsernameMessage,//
    required bool showInvalidPasswordMessage,//
    required String invalidPasswordMessage,//
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
      isLoading: false,
      isAuthFailure: false,
      isNetworkFailure: false,
      isOtherFailure: false,
      showInvalidUsernameMessage: false,
      invalidUsernameMessage: '',
      showInvalidPasswordMessage: false,
      invalidPasswordMessage: '');
}
