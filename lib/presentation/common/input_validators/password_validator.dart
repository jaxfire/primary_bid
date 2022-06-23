
enum PasswordValidatorResult { valid, emptyString }

class PasswordValidator {
// TODO: Add tests
  PasswordValidatorResult validatePassword(String password) {
    if (password.isEmpty) {
      return PasswordValidatorResult.emptyString;
    }

    return PasswordValidatorResult.valid;
  }
}