import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loading() = Loading;
  const factory LoginState.data({required int userId}) = Data;
  const factory LoginState.error([String? message]) = ErrorDetails;
}

// TODO: Add states. Reread DDD chapter. Make them private?