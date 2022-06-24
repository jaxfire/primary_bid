import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/features/cart/cart_repository.dart';
import 'package:primary_bid/features/product/model/product/product.dart';
import 'package:primary_bid/presentation/product_list_screen/widgets/product_list_button/product_list_button_cubit/product_list_button_state.dart';

class ProductListButtonCubit extends Cubit<ProductListButtonState> {
  ProductListButtonCubit({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(ProductListButtonState());

  final CartRepository _cartRepository;

  void addProduct({required Product product}) {
    _cartRepository.addProduct(product: product);
  }

  void deleteProduct({required Product product}) {
    _cartRepository.deleteProduct(product: product);
  }
}
