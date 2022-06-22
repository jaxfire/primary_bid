
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/features/categories/category_repository.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoriesState.initial());

  final CategoryRepository _categoryRepository;

  void getCategories() {
    emit(CategoriesState.initial().copyWith(isLoading: true));
  }
}
