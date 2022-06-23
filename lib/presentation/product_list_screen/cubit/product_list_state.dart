import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_bid/features/product/model/product/Product.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState({
    required bool isLoading,
    required bool isNetworkFailure,
    required bool isOtherFailure, // TODO: Change to unexpected error?
    required List<Product> data,
  }) = _ProductListState;

  factory ProductListState.initial() => const ProductListState(
        isLoading: false,
        isNetworkFailure: false,
        isOtherFailure: false,
        data: [],
      );
}
