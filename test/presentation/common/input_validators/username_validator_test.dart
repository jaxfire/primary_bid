import 'package:flutter_test/flutter_test.dart';
import 'package:primary_bid/presentation/common/input_validators/username_validator.dart';

void main() {
  late UsernameValidator sut;

  setUp(() {
    sut = UsernameValidator();
  });

  test(
    'GIVEN a non-empty String input WHEN validateUserName() is called THEN UsernameValidatorResult.valid is returned',
    () async {
      expect(sut.validateUserName('test'), equals(UsernameValidatorResult.valid));
    },
  );

  test(
    'GIVEN an empty String input WHEN validateUserName() is called THEN UsernameValidatorResult.emptyString is returned',
    () async {
      expect(sut.validateUserName(''), equals(UsernameValidatorResult.emptyString));
    },
  );
}
