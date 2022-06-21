import 'package:either_dart/either.dart';
import 'package:primary_bid/features/common/domain/value_object.dart';
import 'package:primary_bid/features/login/domain/values/failures/failures.dart';
import 'package:primary_bid/features/login/domain/values/value_validators.dart';

class Username extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Username(String input) {
    return Username._(
      validateUserName(input),
    );
  }

  const Username._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}