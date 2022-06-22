import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_bid/features/common/urls.dart';
import 'package:primary_bid/features/login/login_failure.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source_http.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late LoginRemoteDataSource sut;
  late MockHttpClient mockHttpClient;

  const String fakeToken = 'abcde';
  final String fakeResponse = jsonEncode({'token': fakeToken});

  setUpAll(() {
    registerFallbackValue(Uri.parse(''));
    registerFallbackValue(<String, String>{});
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    sut = LoginRemoteDataSourceHttp(client: mockHttpClient);
  });

  group('failures', () {
    test(
      'WHEN the http.Client throws a SocketException THEN sut returns LoginFailure.network',
      () async {
        // ARRANGE
        when(() => mockHttpClient.post(
              any(),
              headers: any(named: 'headers'),
              body: any(named: 'body'),
            )).thenThrow(const SocketException(''));

        // ACT
        final result = await sut.login(username: 'username', password: 'password');

        // ASSERT
        expect(result.left, equals(LoginFailure.network));
      },
    );

    test(
      'WHEN the http.Client throws a TimeoutException THEN sut returns LoginFailure.network',
      () async {
        // ARRANGE
        when(() => mockHttpClient.post(
              any(),
              headers: any(named: 'headers'),
              body: any(named: 'body'),
            )).thenThrow(TimeoutException(''));

        // ACT
        final result = await sut.login(username: 'username', password: 'password');

        // ASSERT
        expect(result.left, equals(LoginFailure.network));
      },
    );

    test(
      'WHEN the http.Client throws an Exception THEN sut returns LoginFailure.other',
      () async {
        // ARRANGE
        when(() => mockHttpClient.post(
              any(),
              headers: any(named: 'headers'),
              body: any(named: 'body'),
            )).thenThrow(Exception());

        // ACT
        final result = await sut.login(username: 'username', password: 'password');

        // ASSERT
        expect(result.left, equals(LoginFailure.other));
      },
    );

    test(
      "WHEN the http.Client returns with 401 THEN the sut returns LoginFailure.auth",
          () async {
        // ARRANGE
        when(() => mockHttpClient.post(
          any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        )).thenAnswer((_) => Future.value(http.Response(fakeResponse, 401)));

        // ACT
        final result = await sut.login(username: 'username', password: 'password');

        // ASSERT
        expect(result.left, LoginFailure.auth);
      },
    );


    test(
      "WHEN the http.Client returns with any response code that is non-200 and not 401 THEN the sut returns LoginFailure.other",
          () async {
        // ARRANGE
        when(() => mockHttpClient.post(
          any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        )).thenAnswer((_) => Future.value(http.Response(fakeResponse, 500)));

        // ACT
        final result = await sut.login(username: 'username', password: 'password');

        // ASSERT
        expect(result.left, LoginFailure.other);
      },
    );
  });

  group('success', () {
    test(
      "WHEN the http.Client returns successfully THEN the sut returns the response.body's token",
      () async {
        // ARRANGE
        when(() => mockHttpClient.post(
              any(),
              headers: any(named: 'headers'),
              body: any(named: 'body'),
            )).thenAnswer((_) => Future.value(http.Response(fakeResponse, 200)));

        // ACT
        final result = await sut.login(username: 'username', password: 'password');

        // ASSERT
        expect(result.right, fakeToken);
      },
    );
  });
}
