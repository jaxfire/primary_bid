import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:primary_bid/features/categories/category_failure.dart';
import 'package:primary_bid/features/login/login_failure.dart';

abstract class CategoryRemoteDataSource {
  /// Calls the https://fakestoreapi.com/products/categories endpoint.
  // TODO: Document the Failure types and reasons
  Future<Either<CategoryFailure, List<String>>> getCategories();
}
