import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_bid/features/product/model/product/rating/rating.dart';

part 'Product.freezed.dart';
part 'Product.g.dart';

@freezed
class Product with _$Product {

  const factory Product({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required Rating rating,  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json)
  => _$ProductFromJson(json);
}
