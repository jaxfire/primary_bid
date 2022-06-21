import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_failure.freezed.dart';

@freezed
class LoginFailure with _$LoginFailure {
  const factory LoginFailure.authFailure() = AuthFailure;
  const factory LoginFailure.serverFailure() = ServerFailure;
}
