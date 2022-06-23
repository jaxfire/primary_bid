import 'package:flutter/material.dart';
import 'package:primary_bid/features/product/model/product/Product.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/product_list_screen/widgets/product_list_button/product_list_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(product.image, alignment: Alignment.centerLeft),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      Text('£${product.price.toString()}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: ProductListButton(
                              productListButtonType: ProductListButtonType.delete,
                              product: product,
                            ),
                          ),
                          Flexible(
                            child: ProductListButton(
                              productListButtonType: ProductListButtonType.add,
                              product: product,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}