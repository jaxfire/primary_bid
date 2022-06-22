import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    required bool isLoading,
    required bool isNetworkFailure,
    required bool isOtherFailure,
    required List<String> data,
  }) = _CategoriesState;

  factory CategoriesState.initial() => const CategoriesState(
        isLoading: false,
        isNetworkFailure: false,
        isOtherFailure: false,
        data: [],
      );
}
