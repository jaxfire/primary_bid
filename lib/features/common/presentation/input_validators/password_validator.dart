
enum PasswordValidatorResult { valid, emptyString }

class PasswordValidator {

  PasswordValidatorResult validatePassword(String password) {
    if (password.isEmpty) {
      return PasswordValidatorResult.emptyString;
    }

    return PasswordValidatorResult.valid;
  }
}