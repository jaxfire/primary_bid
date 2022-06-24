import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/features/cart/cart_repository.dart';
import 'package:primary_bid/presentation/common/widgets/cart_icon/cubit/cart_icon_state.dart';

class CartIconCubit extends Cubit<CartIconState> {
  CartIconCubit({
    required CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(CartIconState.initial()) {
    observeCartCount();
  }

  final CartRepository _cartRepository;

  void observeCartCount() {
    _cartRepository.watchCartCount().listen((event) {
      event.either(
        (failure) {
          // Ignore for this demo
        },
        (cartCount) {
          emit(state.copyWith(itemCount: cartCount));
        },
      );
    });
  }
}
