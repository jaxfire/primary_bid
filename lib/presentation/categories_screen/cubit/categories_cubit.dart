import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/features/categories/category_failure.dart';
import 'package:primary_bid/features/categories/category_repository.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoriesState.initial());

  final CategoryRepository _categoryRepository;

  void getCategories() async {
    emit(CategoriesState.initial().copyWith(isLoading: true));

    final getCategoriesResult = await _categoryRepository.getCategories();

    getCategoriesResult.either(
      (categoryFailure) {
        switch (categoryFailure) {
          case GetCategoriesFailure.network:
            emit(state.copyWith(failureMessage: 'Check network connection.', isLoading: false));
            break;
          case GetCategoriesFailure.other:
            emit(state.copyWith(failureMessage: 'Something went wrong. Please try again.', isLoading: false));
            break;
        }
      },
      (categories) {
        emit(state.copyWith(data: categories, isLoading: false));
      },
    );
  }
}
