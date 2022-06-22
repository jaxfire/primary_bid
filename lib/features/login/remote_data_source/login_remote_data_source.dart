import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:primary_bid/features/login/login_failure.dart';

abstract class LoginRemoteDataSource {
  /// Calls the https://fakestoreapi.com/auth/login endpoint.
  // TODO: Document the Failure types and reasons
  Future<Either<LoginFailure, String>> login({required String username, required String password});
}
