import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:primary_bid/features/product/model/product/rating/rating.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {

  @HiveType(typeId: 0, adapterName: 'ProductHiveAdapter')

  const factory Product({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required double price,
    @HiveField(3) required String description,
    @HiveField(4) required String category,
    @HiveField(5) required String image,
    @HiveField(6) required Rating rating,  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json)
  => _$ProductFromJson(json);
}
