import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/features/categories/category_failure.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source.dart';
import 'package:primary_bid/features/common/urls.dart';

class CategoryRemoteDataSourceHttp implements CategoryRemoteDataSource {
  CategoryRemoteDataSourceHttp({
    required http.Client client,
  }) : _client = client;

  final http.Client _client;

  @override
  Future<Either<GetCategoriesFailure, List<String>>> getCategories() async {
    try {
      return await _getCategories();
    } on SocketException {
      return const Left(GetCategoriesFailure.network);
    } on TimeoutException {
      return const Left(GetCategoriesFailure.network);
    } catch (e) {
      return const Left(GetCategoriesFailure.other);
    }
  }

  Future<Either<GetCategoriesFailure, List<String>>> _getCategories() async {
    final response = await _client.get(
      Uri.parse('$baseUrl$getCategoriesEndpoint'), // TODO: Unit test this. Rework storing of urls.
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      Iterable iterableDynamic = json.decode(response.body);
      List<String> listString = iterableDynamic.map((element) => element.toString()).toList();
      return Right(listString);
    } else {
      return const Left(GetCategoriesFailure.other);
    }
  }
}
