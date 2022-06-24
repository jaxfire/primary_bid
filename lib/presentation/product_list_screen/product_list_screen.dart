import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/app/injection_container.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/common/styles.dart';
import 'package:primary_bid/presentation/common/widgets/cart_icon/cart_icon.dart';
import 'package:primary_bid/presentation/product_list_screen/cubit/product_list_cubit.dart';
import 'package:primary_bid/presentation/product_list_screen/cubit/product_list_state.dart';
import 'package:primary_bid/presentation/product_list_screen/widgets/product_card.dart';

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
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    const Text(
                      'Products',
                      style: Styles.screenTitle,
                    ),
                    Visibility(
                      visible: state.failureMessage.isNotEmpty,
                      child: Text(state.failureMessage),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: state.data[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: CartIcon(),
              ),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                  visible: state.isLoading,
                  child: const CircularProgressIndicator(
                    color: Colours.accent,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
