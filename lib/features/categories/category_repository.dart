import 'package:either_dart/src/either.dart';
import 'package:primary_bid/features/categories/category_failure.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source.dart';

abstract class CategoryRepository {
  Future<Either<CategoryFailure, List<String>>> getCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required CategoryRemoteDataSource categoryRemoteDataSource,
  }) : _categoryRemoteDataSource = categoryRemoteDataSource;

  final CategoryRemoteDataSource _categoryRemoteDataSource;

  @override
  Future<Either<CategoryFailure, List<String>>> getCategories() async {
    return await _categoryRemoteDataSource.getCategories();
  }
}
