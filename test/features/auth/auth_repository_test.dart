import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_bid/features/auth/auth_repository.dart';
import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source.dart';


class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

void main() {

  late AuthRepositoryImpl sut;
  late MockAuthLocalDataSource mockAuthLocalDataSource;

  setUp(() {
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    sut = AuthRepositoryImpl(authLocalDataSource: mockAuthLocalDataSource);
  });

  test(
    'WHEN setAuthToken(<value>) is called THEN AuthLocalDataSource.setAuthToken() is called with the same <value> AND that it is called only once',
    () async {
      // ARRANGE
      const testAuthToken = 'abc';
      // ACT
      sut.setAuthToken(authToken: testAuthToken);
      // ASSERT
      verify(() => mockAuthLocalDataSource.setAuthToken(authToken: testAuthToken)).called(1);
    },
  );
}