import 'package:either_dart/src/either.dart';
import 'package:primary_bid/features/login/data/failures/login_failure.dart';
import 'package:primary_bid/features/login/domain/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {

  @override
  Future<Either<LoginFailure, String>> login({required String emailAddress, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

}