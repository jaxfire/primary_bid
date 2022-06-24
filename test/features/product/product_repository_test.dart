import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_bid/features/product/product_failure.dart';
import 'package:primary_bid/features/product/product_repository.dart';
import 'package:primary_bid/features/product/remote_data_source/product_remote_data_source.dart';

class MockProductRemoteDataSource extends Mock implements ProductRemoteDataSource {}

void main() {
  late ProductRepositoryImpl sut;
  late MockProductRemoteDataSource mockProductRemoteDataSource;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    sut = ProductRepositoryImpl(productRemoteDataSource: mockProductRemoteDataSource);
  });

  test(
    'WHEN getProductsInCategory() is called THEN ProductRemoteDataSource.getProductsInCategory() is called with the same arguments AND only once',
        () async {
      // ARRANGE
      const testCategoryName = 'a';
      when(() => mockProductRemoteDataSource.getProductsInCategory(categoryName: testCategoryName))
          .thenAnswer((_) => Future.value(const Left(GetProductsFailure.other)));
      // ACT
      sut.getProductsInCategory(categoryName: testCategoryName);
      // ASSERT
      verify(() => mockProductRemoteDataSource.getProductsInCategory(categoryName: testCategoryName)).called(1);
    },
  );
}
