import 'package:either_dart/either.dart';
import 'package:primary_bid/features/login/domain/values/failures/failures.dart';

Either<ValueFailure<String>, String> validateUserName(String input) {
  if (input.isNotEmpty) {
    return Right(input);
  } else {
    return Left(ValueFailure.invalidPassword(failedValue: input, feedbackMessage: 'Username must not be empty'));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.isNotEmpty) {
    return Right(input);
  } else {
    return Left(ValueFailure.invalidPassword(failedValue: input, feedbackMessage: 'Password must not be empty'));
  }
}
