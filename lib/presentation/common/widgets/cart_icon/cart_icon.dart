import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/app/injection_container.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/common/widgets/cart_icon/cubit/cart_icon_cubit.dart';
import 'package:primary_bid/presentation/common/widgets/cart_icon/cubit/cart_icon_state.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({super.key});

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  final cartIconCubit = getIt<CartIconCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartIconCubit, CartIconState>(
      bloc: cartIconCubit,
      builder: (context, state) {
        return BlocBuilder<CartIconCubit, CartIconState>(
          bloc: cartIconCubit,
          builder: (context, state) {
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colours.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          state.itemCount.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        );
      },
    );
  }
}
