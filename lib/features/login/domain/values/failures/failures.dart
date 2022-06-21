import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidUsername({required T failedValue, required String feedbackMessage}) = InvalidUsername<T>;
  const factory ValueFailure.invalidPassword({required T failedValue, required String feedbackMessage}) = InvalidPassword<T>;
}