import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_bid/features/categories/category_failure.dart';
import 'package:primary_bid/features/categories/category_repository.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source.dart';

class MockCategoryRemoteDataSource extends Mock implements CategoryRemoteDataSource {}

void main() {
  late CategoryRepositoryImpl sut;
  late MockCategoryRemoteDataSource mockCategoryLocalDataSource;

  setUp(() {
    mockCategoryLocalDataSource = MockCategoryRemoteDataSource();
    sut = CategoryRepositoryImpl(categoryRemoteDataSource: mockCategoryLocalDataSource);
  });

  test(
    'WHEN getCategories() is called THEN CategoryRemoteDataSource.getCategories() is called only once',
    () async {
      // ARRANGE
      when(() => mockCategoryLocalDataSource.getCategories())
          .thenAnswer((_) => Future.value(const Left(GetCategoriesFailure.other)));
      // ACT
      sut.getCategories();
      // ASSERT
      verify(() => mockCategoryLocalDataSource.getCategories()).called(1);
    },
  );
}
