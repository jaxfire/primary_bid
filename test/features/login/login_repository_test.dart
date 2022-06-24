import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_bid/features/login/login_failure.dart';
import 'package:primary_bid/features/login/login_repository.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source.dart';

class MockLoginRemoteDataSource extends Mock implements LoginRemoteDataSource {}

void main() {
  late LoginRepositoryImpl sut;
  late MockLoginRemoteDataSource mockLoginRemoteDataSource;

  setUp(() {
    mockLoginRemoteDataSource = MockLoginRemoteDataSource();
    sut = LoginRepositoryImpl(loginRemoteDataSource: mockLoginRemoteDataSource);
  });

  test(
    'WHEN login() is called THEN CategoryRemoteDataSource.login() is called with the same arguments AND only once',
    () async {
      // ARRANGE
      const testUsername = 'a';
      const testPassword = 'b';
      when(() => mockLoginRemoteDataSource.login(username: testUsername, password: testPassword))
          .thenAnswer((_) => Future.value(const Left(LoginFailure.other)));
      // ACT
      sut.login(username: testUsername, password: testPassword);
      // ASSERT
      verify(() => mockLoginRemoteDataSource.login(username: testUsername, password: testPassword)).called(1);
    },
  );
}
