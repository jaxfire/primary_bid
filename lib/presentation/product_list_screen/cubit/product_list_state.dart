import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_bid/features/product/model/product/product.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState({
    required bool isLoading,
    required String failureMessage,
    required List<Product> data,
  }) = _ProductListState;

  factory ProductListState.initial() => const ProductListState(
        isLoading: false,
        failureMessage: '',
        data: [],
      );
}
