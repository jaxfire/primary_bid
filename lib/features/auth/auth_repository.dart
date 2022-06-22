import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source.dart';

abstract class AuthRepository {
  void setAuthToken({required String authToken});
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthLocalDataSource authLocalDataSource,
  }) : _authLocalDataSource = authLocalDataSource;

  final AuthLocalDataSource _authLocalDataSource;

  @override
  void setAuthToken({required String authToken}) {
    _authLocalDataSource.setAuthToken(authToken: authToken);
  }
}
