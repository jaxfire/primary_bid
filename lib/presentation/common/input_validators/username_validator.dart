
enum UsernameValidatorResult { valid, emptyString }

class UsernameValidator {
// TODO: Add tests
  UsernameValidatorResult validateUserName(String username) {
    if (username.isEmpty) {
      return UsernameValidatorResult.emptyString;
    }

    return UsernameValidatorResult.valid;
  }
}