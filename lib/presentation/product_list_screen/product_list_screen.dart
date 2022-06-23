import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/features/product/model/product/Product.dart';
import 'package:primary_bid/meta/injection_container.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/product_list_screen/cubit/product_list_cubit.dart';
import 'package:primary_bid/presentation/product_list_screen/cubit/product_list_state.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({required this.categoryName, super.key});

  final String categoryName;

  static const routeName = '/product_list';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final cubit = getIt<ProductListCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getProductsInCategory(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: primary,
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Visibility(
                        visible: state.isLoading,
                        child: const CircularProgressIndicator(),
                      ),
                      // TODO: Could these be combined? One widget with a message.
                      Visibility(
                        visible: state.isNetworkFailure,
                        child: const Text('Check network connection.'),
                      ),
                      Visibility(
                        visible: state.isOtherFailure,
                        child: const Text('Something went wrong. Please try again.'),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: state.data[index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

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
                      Text(product.title, overflow: TextOverflow.ellipsis, maxLines: 4,),
                      Text('£${product.price.toString()}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: ProductListButton(
                              colour: tertiary,
                              iconData: Icons.delete_forever,
                              onClickHandler: () {
                                // TODO
                              },
                            ),
                          ),
                          Flexible(
                            child: ProductListButton(
                              colour: accent,
                              iconData: Icons.add,
                              onClickHandler: () {
                                // TODO
                              },
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

class ProductListButton extends StatelessWidget {
  const ProductListButton({
    required this.colour,
    required this.iconData,
    required this.onClickHandler,
    super.key,
  });

  final Color colour;
  final IconData iconData;
  final VoidCallback onClickHandler;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: colour,
      textColor: Colors.white,
      padding: const EdgeInsets.all(16),
      shape: const CircleBorder(),
      child: Icon(
        iconData,
        size: 18,
      ),
    );
  }
}
