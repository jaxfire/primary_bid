import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required String failureMessage,
    required String invalidUsernameMessage,
    required String invalidPasswordMessage,
    required String navigateTo,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
      isLoading: false,
      failureMessage: '',
      invalidUsernameMessage: '',
      invalidPasswordMessage: '',
      navigateTo: '');
}
