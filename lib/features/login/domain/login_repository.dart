import 'package:either_dart/either.dart';
import 'package:primary_bid/features/login/data/failures/login_failure.dart';
import 'package:primary_bid/features/login/domain/values/value_objects.dart';

abstract class LoginRepository {
  Either<LoginFailure, String> login({required Username emailAddress, required Password password});
}