import 'package:flutter_test/flutter_test.dart';
import 'package:primary_bid/presentation/common/input_validators/password_validator.dart';

void main() {
  late PasswordValidator sut;

  setUp(() {
    sut = PasswordValidator();
  });

  test(
    'GIVEN a non-empty String input WHEN validatePassword() is called THEN PasswordValidatorResult.valid is returned',
    () async {
      expect(sut.validatePassword('test'), equals(PasswordValidatorResult.valid));
    },
  );

  test(
    'GIVEN an empty String input WHEN validatePassword() is called THEN PasswordValidatorResult.emptyString is returned',
    () async {
      expect(sut.validatePassword(''), equals(PasswordValidatorResult.emptyString));
    },
  );
}
