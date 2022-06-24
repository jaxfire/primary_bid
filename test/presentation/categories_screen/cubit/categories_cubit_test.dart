import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:primary_bid/features/categories/category_failure.dart';
import 'package:primary_bid/features/categories/category_repository.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_cubit.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_state.dart';

class MockCategoriesCubit extends MockCubit<CategoriesState> implements CategoriesCubit {}

class MockCategoryRemoteDataSource extends Mock implements CategoryRemoteDataSource {}

void main() {
  late MockCategoryRemoteDataSource mockCategoryRemoteDataSource;
  late CategoryRepositoryImpl categoryRepositoryImpl;
  late CategoriesCubit sut;

  const testCategoryNames = ['a', 'b', 'c'];

  setUp(() {
    mockCategoryRemoteDataSource = MockCategoryRemoteDataSource();
    categoryRepositoryImpl = CategoryRepositoryImpl(categoryRemoteDataSource: mockCategoryRemoteDataSource);
    sut = CategoriesCubit(categoryRepository: categoryRepositoryImpl);
  });

  group('CounterBloc', () {
    blocTest<CategoriesCubit, CategoriesState>(
      'emits [] when nothing is added',
      build: () => sut,
      expect: () => [],
    );

    blocTest<CategoriesCubit, CategoriesState>(
        'WHEN GetCategoriesFailure.network is received THEN [Loading, NetworkFailureMessage] is emitted',
        build: () {
          when(() => mockCategoryRemoteDataSource.getCategories()).thenAnswer(
            (_) => Future.value(const Left(GetCategoriesFailure.network)),
          );
          return sut;
        },
        act: (cubit) => cubit.getCategories(),
        expect: () => [
              CategoriesState.initial().copyWith(isLoading: true),
              CategoriesState.initial().copyWith(
                failureMessage: 'Check network connection.',
                isLoading: false,
              ),
            ],
        tearDown: () => reset(mockCategoryRemoteDataSource));

    blocTest<CategoriesCubit, CategoriesState>(
        'WHEN GetCategoriesFailure.other is received THEN [Loading, SomethingWentWrong] is emitted',
        build: () {
          when(() => mockCategoryRemoteDataSource.getCategories()).thenAnswer(
            (_) => Future.value(const Left(GetCategoriesFailure.other)),
          );
          return sut;
        },
        act: (cubit) => cubit.getCategories(),
        expect: () => [
              CategoriesState.initial().copyWith(isLoading: true),
              CategoriesState.initial().copyWith(
                failureMessage: 'Something went wrong. Please try again.',
                isLoading: false,
              ),
            ],
        tearDown: () => reset(mockCategoryRemoteDataSource));

    blocTest<CategoriesCubit, CategoriesState>(
        'WHEN a list of category names is received THEN [Loading, Categories] is emitted',
        build: () {
          when(() => mockCategoryRemoteDataSource.getCategories()).thenAnswer(
            (_) => Future.value(const Right(testCategoryNames)),
          );
          return sut;
        },
        act: (cubit) => cubit.getCategories(),
        expect: () => [
              CategoriesState.initial().copyWith(isLoading: true),
              CategoriesState.initial().copyWith(
                isLoading: false,
                data: testCategoryNames,
              ),
            ],
        tearDown: () => reset(mockCategoryRemoteDataSource));
  });
}
