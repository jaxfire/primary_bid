import 'package:either_dart/either.dart';
import 'package:primary_bid/features/cart/cart_failure.dart';
import 'package:primary_bid/features/product/model/product/product.dart';

abstract class CartLocalDataSource {
  /// Adds the [Product] to the cart in local storage.
  void addProduct({required Product product});


  /// Removes the [Product] from the cart in local storage.
  void deleteProduct({required Product product});

  /// Returns a stream which emits the number of [Product]s in the cart whenever a [Product] is added or deleted.
  Stream<Either<CartFailure, int>> watchCartCount();
}