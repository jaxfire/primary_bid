import 'package:either_dart/either.dart';
import 'package:primary_bid/features/cart/cart_failure.dart';
import 'package:primary_bid/features/cart/local_data_source/cart_local_data_source.dart';
import 'package:primary_bid/features/product/model/product/Product.dart';

abstract class CartRepository {
  void addProduct({required Product product});

  void deleteProduct({required Product product});

  Stream<Either<CartFailure, int>> watchCartCount();
}

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({
    required CartLocalDataSource cartLocalDataSource,
  }) : _cartLocalDataSource = cartLocalDataSource;

  final CartLocalDataSource _cartLocalDataSource;

  @override
  void addProduct({required Product product}) {
    _cartLocalDataSource.addProduct(product: product);
  }

  @override
  void deleteProduct({required Product product}) {
    _cartLocalDataSource.deleteProduct(product: product);
  }

  @override
  Stream<Either<CartFailure, int>> watchCartCount() {
    return _cartLocalDataSource.watchCartCount();
  }
}
