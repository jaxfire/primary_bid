import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@freezed
class Rating with _$Rating {

  @HiveType(typeId: 1, adapterName: 'RatingHiveAdapter')

  const factory Rating({
    @HiveField(0) required double rate,
    @HiveField(1) required int count,
  }) = _Rating;

  factory Rating.fromJson(Map<String, Object?> json)
  => _$RatingFromJson(json);
}