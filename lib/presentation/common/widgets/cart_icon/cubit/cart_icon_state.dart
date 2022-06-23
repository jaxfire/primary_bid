import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_icon_state.freezed.dart';

@freezed
class CartIconState with _$CartIconState {

  const factory CartIconState({
    required int itemCount,
  }) = _CartIconState;

  factory CartIconState.initial() => const CartIconState(
    itemCount: 0,
  );
}