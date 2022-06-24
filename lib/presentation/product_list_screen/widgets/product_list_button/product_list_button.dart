import 'package:flutter/material.dart';
import 'package:primary_bid/features/product/model/product/product.dart';
import 'package:primary_bid/app/injection_container.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/product_list_screen/widgets/product_list_button/product_list_button_cubit/product_list_button_cubit.dart';

enum ProductListButtonType {
  add,
  delete,
}

class ProductListButton extends StatelessWidget {
  ProductListButton({
    required this.productListButtonType,
    required this.product,
    super.key,
  });

  final cartCubit = getIt<ProductListButtonCubit>();

  final ProductListButtonType productListButtonType;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        productListButtonType == ProductListButtonType.add
            ? cartCubit.addProduct(product: product)
            : cartCubit.deleteProduct(product: product);
      },
      color: productListButtonType == ProductListButtonType.add ? Colours.accent : Colours.tertiary,
      textColor: Colors.white,
      padding: const EdgeInsets.all(16),
      shape: const CircleBorder(),
      child: Icon(
        productListButtonType == ProductListButtonType.add ? Icons.add : Icons.delete_forever,
        size: 18,
      ),
    );
  }
}
