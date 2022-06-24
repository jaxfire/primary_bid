import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/features/common/urls.dart';
import 'package:primary_bid/features/product/model/product/Product.dart';
import 'package:primary_bid/features/product/product_failure.dart';
import 'package:primary_bid/features/product/remote_data_source/product_remote_data_source.dart';

class ProductRemoteDataSourceHttp implements ProductRemoteDataSource {
  ProductRemoteDataSourceHttp({
    required http.Client client,
  }) : _client = client;

  final http.Client _client;

  @override
  Future<Either<GetProductsFailure, List<Product>>> getProductsInCategory({required String categoryName}) async {
    try {
      return await _getProductsInCategory(categoryName);
    } on SocketException {
      return const Left(GetProductsFailure.network);
    } on TimeoutException {
      return const Left(GetProductsFailure.network);
    } catch (e) {
      return const Left(GetProductsFailure.other);
    }
  }

  Future<Either<GetProductsFailure, List<Product>>> _getProductsInCategory(String categoryName) async {

    final response = await _client.get(
      Uri.parse('$baseUrl$getProductsInCategoryEndpoint$categoryName'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      Iterable iterableDynamic = json.decode(response.body);
      List<Product> listProduct = iterableDynamic.map((element) => Product.fromJson(element)).toList();
      return Right(listProduct);
    } else {
      return const Left(GetProductsFailure.other);
    }
  }
}
