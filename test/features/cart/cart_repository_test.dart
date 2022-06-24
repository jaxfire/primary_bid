import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_bid/features/cart/cart_repository.dart';
import 'package:primary_bid/features/cart/local_data_source/cart_local_data_source.dart';
import 'package:primary_bid/features/product/model/product/product.dart';
import 'package:primary_bid/features/product/model/product/rating/rating.dart';


class MockCartLocalDataSource extends Mock implements CartLocalDataSource {}

void main() {

  late CartRepositoryImpl sut;
  late MockCartLocalDataSource mockCartLocalDataSource;

  const testProduct = Product(
    id: 1,
    category: 'a',
    description: 'b',
    image: 'c',
    title: 'd',
    price: 1.23,
    rating: Rating(count: 1, rate: 2.0),
  );

  setUp(() {
    mockCartLocalDataSource = MockCartLocalDataSource();
    sut = CartRepositoryImpl(cartLocalDataSource: mockCartLocalDataSource);
  });

  test(
    'WHEN addProduct(<product>) is called THEN CartLocalDataSource.addProduct() is called with the same <product> AND that it is called only once',
        () async {
      // ACT
      sut.addProduct(product: testProduct);
      // ASSERT
      verify(() => mockCartLocalDataSource.addProduct(product: testProduct)).called(1);
    },
  );

  test(
    'WHEN deleteProduct(<product>) is called THEN CartLocalDataSource.deleteProduct() is called with the same <product> AND that it is called only once',
        () async {
      // ACT
      sut.deleteProduct(product: testProduct);
      // ASSERT
      verify(() => mockCartLocalDataSource.deleteProduct(product: testProduct)).called(1);
    },
  );

  // TODO: Test watchCartCount()
}