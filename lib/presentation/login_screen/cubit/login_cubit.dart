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

  void onLoginButtonClicked(String username, String password) async {
    emit(LoginState.initial().copyWith(isLoading: true));

    // TODO: Hash the password here

    final usernameValidatorResponse = _usernameValidator.validateUserName(username);
    final passwordValidatorResponse = _passwordValidator.validatePassword(password);

    if (usernameValidatorResponse != UsernameValidatorResult.valid ||
        passwordValidatorResponse != PasswordValidatorResult.valid) {
      _emitValidationErrorMessages(usernameValidatorResponse, passwordValidatorResponse);
      emit(state.copyWith(isLoading: false));
      return;
    }

    await _attemptLogin(username, password);
  }

  Future<void> _attemptLogin(String username, String password) async {
    final loginResult = await _loginRepository.login(username: username, password: password);
    loginResult.either(
      (loginFailure) {
        handleFailure(loginFailure);
      },
      (authToken) {
        _authRepository.setAuthToken(authToken: authToken);
        emit(LoginState.initial().copyWith(navigateTo: CategoriesScreen.routeName));
      },
    );
  }

  void handleFailure(LoginFailure loginFailure) {
    var errorMessage = '';
    switch (loginFailure) {
      case LoginFailure.auth:
        errorMessage = 'Bad credentials. \nTry: username: mor_2314 password: 83r5^_';
        break;
      case LoginFailure.network:
        errorMessage = 'Check network connection.';
        break;
      case LoginFailure.other:
        errorMessage = 'Something went wrong. Please try again.';
        break;
    }
    emit(
      state.copyWith(failureMessage: errorMessage, isLoading: false));
  }

  void _emitValidationErrorMessages(
    UsernameValidatorResult usernameValidatorResult,
    PasswordValidatorResult passwordValidatorResult,
  ) {
    // This is pointless without more input valid failure cases but this is where we'd handle which feedback messages to show.
    switch (usernameValidatorResult) {
      case UsernameValidatorResult.emptyString:
        emit(state.copyWith(
          invalidUsernameMessage: 'Please provide a username',
        ));
        break;
      case UsernameValidatorResult.valid:
        break;
    }

    switch (passwordValidatorResult) {
      case PasswordValidatorResult.emptyString:
        emit(state.copyWith(
          invalidPasswordMessage: 'Please provide a password',
        ));
        break;
      case PasswordValidatorResult.valid:
        break;
    }
  }
}
