
enum UsernameValidatorResult { valid, emptyString }

class UsernameValidator {

  UsernameValidatorResult validateUserName(String username) {
    if (username.isEmpty) {
      return UsernameValidatorResult.emptyString;
    }

    return UsernameValidatorResult.valid;
  }
}