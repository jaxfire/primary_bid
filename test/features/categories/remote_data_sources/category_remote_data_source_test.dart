import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/features/categories/category_failure.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source_http.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late CategoryRemoteDataSourceHttp sut;
  late MockHttpClient mockHttpClient;

  final testCategoryNames = ['a', 'b', 'c'];
  final String fakeResponse = jsonEncode(testCategoryNames);

  setUpAll(() {
    registerFallbackValue(Uri.parse(''));
    registerFallbackValue(<String, String>{});
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    sut = CategoryRemoteDataSourceHttp(client: mockHttpClient);
  });

  group('failures', () {
    test(
      'WHEN the http.Client throws a SocketException THEN sut returns GetCategoriesFailure.network',
          () async {
        // ARRANGE
        when(() => mockHttpClient.get(
          any(),
          headers: any(named: 'headers'),
        )).thenThrow(const SocketException(''));

        // ACT
        final result = await sut.getCategories();

        // ASSERT
        expect(result.left, equals(GetCategoriesFailure.network));
      },
    );

    test(
      'WHEN the http.Client throws a TimeoutException THEN sut returns GetCategoriesFailure.network',
          () async {
        // ARRANGE
        when(() => mockHttpClient.get(
          any(),
          headers: any(named: 'headers'),
        )).thenThrow(TimeoutException(''));

        // ACT
        final result = await sut.getCategories();

        // ASSERT
        expect(result.left, equals(GetCategoriesFailure.network));
      },
    );

    test(
      'WHEN the http.Client throws an Exception THEN sut returns GetCategoriesFailure.other',
          () async {
        // ARRANGE
        when(() => mockHttpClient.get(
          any(),
          headers: any(named: 'headers'),
        )).thenThrow(Exception());

        // ACT
        final result = await sut.getCategories();

        // ASSERT
        expect(result.left, equals(GetCategoriesFailure.other));
      },
    );

    test(
      "WHEN the http.Client returns with any response code that is non-200 THEN the sut returns GetCategoriesFailure.other",
          () async {
        // ARRANGE
        when(() => mockHttpClient.get(
          any(),
          headers: any(named: 'headers'),
        )).thenAnswer((_) => Future.value(http.Response(fakeResponse, 500)));

        // ACT
        final result = await sut.getCategories();

        // ASSERT
        expect(result.left, GetCategoriesFailure.other);
      },
    );
  });

  group('success', () {
    test(
      "WHEN the http.Client returns successfully THEN the sut returns the list of category names",
          () async {
        // ARRANGE
        when(() => mockHttpClient.get(
          any(),
          headers: any(named: 'headers'),
        )).thenAnswer((_) => Future.value(http.Response(fakeResponse, 200)));

        // ACT
        final result = await sut.getCategories();

        // ASSERT
        expect(result.right, testCategoryNames);
      },
    );
  });
}
