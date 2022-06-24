import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/features/product/model/product/product.dart';
import 'package:primary_bid/features/product/model/product/rating/rating.dart';
import 'package:primary_bid/features/product/product_failure.dart';
import 'package:primary_bid/features/product/remote_data_source/product_remote_data_source.dart';
import 'package:primary_bid/features/product/remote_data_source/product_remote_data_source_http.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late ProductRemoteDataSource sut;
  late MockHttpClient mockHttpClient;

  final testProducts = [
    const Product(
      id: 1,
      title: 'a',
      description: 'b',
      category: 'c',
      image: 'd',
      price: 2.0,
      rating: Rating(
        count: 1,
        rate: 2.0,
      ),
    ),
  ];

  final String fakeResponse = jsonEncode((testProducts));

  setUpAll(() {
    registerFallbackValue(Uri.parse(''));
    registerFallbackValue(<String, String>{});
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    sut = ProductRemoteDataSourceHttp(client: mockHttpClient);
  });

  group('failures', () {
    test(
      'WHEN the http.Client throws a SocketException THEN sut returns GetProductsFailure.network',
      () async {
        // ARRANGE
        when(() => mockHttpClient.get(
              any(),
              headers: any(named: 'headers'),
            )).thenThrow(const SocketException(''));

        // ACT
        final result = await sut.getProductsInCategory(categoryName: 'test');

        // ASSERT
        expect(result.left, equals(GetProductsFailure.network));
      },
    );

    test(
      'WHEN the http.Client throws a TimeoutException THEN sut returns GetProductsFailure.network',
      () async {
        // ARRANGE
        when(() => mockHttpClient.get(
              any(),
              headers: any(named: 'headers'),
            )).thenThrow(TimeoutException(''));

        // ACT
        final result = await sut.getProductsInCategory(categoryName: 'test');

        // ASSERT
        expect(result.left, equals(GetProductsFailure.network));
      },
    );

    test(
      'WHEN the http.Client throws an Exception THEN sut returns GetProductsFailure.other',
      () async {
        // ARRANGE
        when(() => mockHttpClient.get(
              any(),
              headers: any(named: 'headers'),
            )).thenThrow(Exception());

        // ACT
        final result = await sut.getProductsInCategory(categoryName: 'test');

        // ASSERT
        expect(result.left, equals(GetProductsFailure.other));
      },
    );

    test(
      "WHEN the http.Client returns with any response code that is non-200 THEN the sut returns GetProductsFailure.other",
      () async {
        // ARRANGE
        when(() => mockHttpClient.get(
              any(),
              headers: any(named: 'headers'),
            )).thenAnswer((_) => Future.value(http.Response(fakeResponse, 500)));

        // ACT
        final result = await sut.getProductsInCategory(categoryName: 'test');

        // ASSERT
        expect(result.left, GetProductsFailure.other);
      },
    );
  });

  group('success', () {
    test(
      "WHEN the http.Client returns successfully THEN the sut returns the list of Products",
      () async {
        // ARRANGE
        when(() => mockHttpClient.get(
              any(),
              headers: any(named: 'headers'),
            )).thenAnswer((_) => Future.value(http.Response(fakeResponse, 200)));

        // ACT
        final result = await sut.getProductsInCategory(categoryName: 'test');

        // ASSERT
        expect(result.right, testProducts);
      },
    );
  });
}
