import 'package:either_dart/either.dart';
import 'package:primary_bid/features/product/model/product/Product.dart';
import 'package:primary_bid/features/product/product_failure.dart';
import 'package:primary_bid/features/product/remote_data_source/product_remote_data_source.dart';

abstract class ProductRepository {
  Future<Either<GetProductsFailure, List<Product>>> getProductsInCategory({required String categoryName});
}

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({
    required ProductRemoteDataSource productRemoteDataSource,
  }) : _productRemoteDataSource = productRemoteDataSource;

  final ProductRemoteDataSource _productRemoteDataSource;

  @override
  Future<Either<GetProductsFailure, List<Product>>> getProductsInCategory({required String categoryName}) async {
    return await _productRemoteDataSource.getProductsInCategory(categoryName: categoryName);
  }
}
