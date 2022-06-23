import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/features/auth/auth_repository.dart';
import 'package:primary_bid/features/login/login_failure.dart';
import 'package:primary_bid/features/login/login_repository.dart';
import 'package:primary_bid/presentation/categories_screen/categories_screen.dart';
import 'package:primary_bid/presentation/common/input_validators/password_validator.dart';
import 'package:primary_bid/presentation/common/input_validators/username_validator.dart';
import 'package:primary_bid/presentation/login_screen/cubit/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    UsernameValidator usernameValidator,
    PasswordValidator passwordValidator,
    LoginRepository loginRepository,
    AuthRepository authRepository,
  )   : _usernameValidator = usernameValidator,
        _passwordValidator = passwordValidator,
        _loginRepository = loginRepository,
        _authRepository = authRepository,
        super(LoginState.initial());

  final UsernameValidator _usernameValidator;
  final PasswordValidator _passwordValidator;
  final LoginRepository _loginRepository;
  final AuthRepository _authRepository;

  // TODO: Can we break up large cubit/bloc methods?
  void onLoginButtonClicked(String username, String password) async {
    emit(LoginState.initial().copyWith(isLoading: true));

    // TODO: Could hash the password here using DI'd in hasher

    final usernameValidatorResponse = _usernameValidator.validateUserName(username);
    final passwordValidatorResponse = _passwordValidator.validatePassword(password);

    if (usernameValidatorResponse != UsernameValidatorResult.valid ||
        passwordValidatorResponse != PasswordValidatorResult.valid) {
      emitValidationErrorMessages(usernameValidatorResponse, passwordValidatorResponse);
      emit(state.copyWith(isLoading: false));
      return;
    }

    final loginResult = await _loginRepository.login(username: username, password: password);
    loginResult.either(
      (loginFailure) {
        switch (loginFailure) {
          case LoginFailure.auth:
            emit(state.copyWith(isAuthFailure: true, isLoading: false));
            break;
          case LoginFailure.network:
            emit(state.copyWith(isNetworkFailure: true, isLoading: false));
            break;
          case LoginFailure.other:
            emit(state.copyWith(isOtherFailure: true, isLoading: false));
            break;
        }
        emit(state.copyWith(isLoading: false)); // TODO: Is this needed?
      },
      (authToken) {
        _authRepository.setAuthToken(authToken: authToken);
        emit(LoginState.initial().copyWith(navigateTo: CategoriesScreen.routeName));
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
        ));
        break;
      case PasswordValidatorResult.valid:
        break;
    }
  }
}
