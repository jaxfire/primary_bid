import 'package:either_dart/src/either.dart';
import 'package:primary_bid/features/login/login_remote_data_source.dart';
import 'package:primary_bid/features/login/login_failure.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, String>> login({required String username, required String password});
}

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({
    required LoginRemoteDataSource loginRemoteDataSource,
  }) : _loginRemoteDataSource = loginRemoteDataSource;

  final LoginRemoteDataSource _loginRemoteDataSource;

  @override
  Future<Either<LoginFailure, String>> login({required String username, required String password}) async {
    return await _loginRemoteDataSource.login(username: username, password: password);
  }
}
