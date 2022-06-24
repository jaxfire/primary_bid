import 'package:either_dart/either.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:primary_bid/features/cart/cart_failure.dart';
import 'package:primary_bid/features/cart/local_data_source/cart_local_data_source.dart';
import 'package:primary_bid/features/product/model/product/product.dart';

class CartLocalDataSourceHive implements CartLocalDataSource {
  static const String cartHiveBoxKey = 'cart_hive_box_key';

  @override
  void addProduct({required Product product}) async {
    try {
      await Hive.openBox<Product>(cartHiveBoxKey);
      var box = Hive.box<Product>(cartHiveBoxKey);
      box.put(product.id, product);
    } catch (e) {
      // Ignore for this demo
    }
  }

  @override
  void deleteProduct({required Product product}) async {
    try {
      await Hive.openBox<Product>(cartHiveBoxKey);
      var box = Hive.box<Product>(cartHiveBoxKey);
      box.delete(product.id);
    } catch (e) {
      // Ignore for this demo
    }
  }

  @override
  Stream<Either<CartFailure, int>> watchCartCount() async* {
    await Hive.openBox<Product>(cartHiveBoxKey);
    var box = Hive.box<Product>(cartHiveBoxKey);
    try {
      await for (final boxEvent in box.watch()) {
        yield Right(box.length);
      }
    } catch (e) {
      yield Left(CartFailure());
    }
  }
}
