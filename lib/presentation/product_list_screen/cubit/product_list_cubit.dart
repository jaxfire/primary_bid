import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/features/product/product_failure.dart';
import 'package:primary_bid/features/product/product_repository.dart';
import 'package:primary_bid/presentation/product_list_screen/cubit/product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit({required ProductRepository productRepository})
      : _productListRepository = productRepository,
        super(ProductListState.initial());

  final ProductRepository _productListRepository;

  // TODO: Rename to get all categories?
  void getProductsInCategory(String categoryName) async {
    emit(ProductListState.initial().copyWith(isLoading: true));

    final getProductsInCategoryResult = await _productListRepository.getProductsInCategory(categoryName);

    getProductsInCategoryResult.either(
      (getProductsFailure) {
        switch (getProductsFailure) {
          case GetProductsFailure.network:
            emit(ProductListState.initial().copyWith(isNetworkFailure: true));
            break;
          case GetProductsFailure.other:
            emit(ProductListState.initial().copyWith(isOtherFailure: true));
            break;
        }
      },
      (products) {
        emit(state.copyWith(data: products, isLoading: false));
      },
    );
  }
}
