import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/meta/injection_container.dart';
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
            return Container(
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              height: 50,
              width: 50,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  state.itemCount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
