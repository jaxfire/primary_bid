import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:primary_bid/features/common/presentation/input_validators/password_validator.dart';
import 'package:primary_bid/features/common/presentation/input_validators/username_validator.dart';
import 'package:primary_bid/features/login/data/failures/login_failure.dart';
import 'package:primary_bid/features/login/domain/login_repository.dart';
import 'package:primary_bid/presentation/login/cubit/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    UsernameValidator usernameValidator,
    PasswordValidator passwordValidator,
    LoginRepository loginRepository,
  )   : _usernameValidator = usernameValidator,
        _passwordValidator = passwordValidator,
        _loginRepository = loginRepository,
        super(LoginState.initial());

  final UsernameValidator _usernameValidator;
  final PasswordValidator _passwordValidator;
  final LoginRepository _loginRepository;

  // TODO: Can we break up large cubit/bloc methods?
  void onLoginButtonClicked(String username, String password) async {
    emit(state.copyWith(isLoading: true));

    // TODO: Could hash the password here using DI'd in hasher

    final usernameValidatorResponse = _usernameValidator.validateUserName(username);
    final passwordValidatorResponse = _passwordValidator.validatePassword(password);

    if (usernameValidatorResponse != UsernameValidatorResult.valid ||
        passwordValidatorResponse != PasswordValidatorResult.valid) {
      // Call function to emit error messages and return
      emitValidationErrorMessages(usernameValidatorResponse, passwordValidatorResponse);
      return;
    }

    // Valid input from here onwards

    // Make request
    final loginResult = await _loginRepository.login(username: username, password: password);
    // Request success or failure?
    loginResult.either(
      (failure) {
        // onFailure. Show relevant error message. Network or Auth.
        switch (failure) {
          case LoginFailure.auth:
            emit(state.copyWith(isAuthFailure: true));
            break;
          case LoginFailure.network:
            emit(state.copyWith(isNetworkFailure: true));
            break;
          case LoginFailure.other:
            emit(state.copyWith(isOtherFailure: true));
            break;
        }
      },
      (token) {
        // onSuccess. Save auth token. Proceed regardless.
        // TODO: Save auth token
      },
    );
  }

  void emitValidationErrorMessages(
    UsernameValidatorResult usernameValidatorResult,
    PasswordValidatorResult passwordValidatorResult,
  ) {
    // This is pointless without more input valid failure cases but this is where we'd handle which feedback messages to show.
    switch (usernameValidatorResult) {
      case UsernameValidatorResult.emptyString:
        emit(state.copyWith(
          invalidUsernameMessage: 'Please provide a username',
          showInvalidUsernameMessage: true,
          isLoading: false,
        ));
        break;
      case UsernameValidatorResult.valid:
        break;
    }

    switch (passwordValidatorResult) {
      case PasswordValidatorResult.emptyString:
        emit(state.copyWith(
          invalidPasswordMessage: 'Please provide a password',
          showInvalidPasswordMessage: true,
          isLoading: false,
        ));
        break;
      case PasswordValidatorResult.valid:
        break;
    }
  }
}
