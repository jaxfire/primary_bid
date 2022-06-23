import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:primary_bid/features/product/model/product/Product.dart';
import 'package:primary_bid/features/product/product_failure.dart';

abstract class ProductRemoteDataSource {
  /// Calls the https://fakestoreapi.com/products/category/<category_name> endpoint.
  // TODO: Document the Failure types and reasons
  Future<Either<GetProductsFailure, List<Product>>> getProductsInCategory(String categoryName);
}
