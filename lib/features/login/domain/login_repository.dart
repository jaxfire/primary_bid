import 'package:either_dart/either.dart';
import 'package:primary_bid/features/login/data/failures/login_failure.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, String>> login({required String emailAddress, required String password});
}