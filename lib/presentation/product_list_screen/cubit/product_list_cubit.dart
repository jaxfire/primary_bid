import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/features/cart/cart_repository.dart';
import 'package:primary_bid/features/product/product_failure.dart';
import 'package:primary_bid/features/product/product_repository.dart';
import 'package:primary_bid/presentation/product_list_screen/cubit/product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit({
    required ProductRepository productRepository,
  })  : _productListRepository = productRepository,
        super(ProductListState.initial());

  final ProductRepository _productListRepository;

  void getProductsInCategory(String categoryName) async {
    emit(ProductListState.initial().copyWith(isLoading: true));

    final getProductsInCategoryResult = await _productListRepository.getProductsInCategory(categoryName: categoryName);

    getProductsInCategoryResult.either(
      (getProductsFailure) {
        switch (getProductsFailure) {
          case GetProductsFailure.network:
            emit(ProductListState.initial().copyWith(failureMessage: 'Check network connection.'));
            break;
          case GetProductsFailure.other:
            emit(ProductListState.initial().copyWith(failureMessage: 'Something went wrong. Please try again.'));
            break;
        }
      },
      (products) {
        emit(state.copyWith(data: products, isLoading: false));
      },
    );
  }
}
