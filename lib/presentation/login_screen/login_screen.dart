import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/app/injection_container.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/common/styles.dart';

import 'package:primary_bid/presentation/login_screen/cubit/login_cubit.dart';
import 'package:primary_bid/presentation/login_screen/cubit/state/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final cubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<LoginCubit, LoginState>(
        bloc: cubit,
        listener: (context, state) {
          if (state.navigateTo.isNotEmpty) {
            Navigator.pushNamedAndRemoveUntil(context, state.navigateTo, (_) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colours.tertiary)),
              onPressed: state.isLoading
                  ? null
                  : () {
                      cubit.onLoginButtonClicked(
                        _usernameController.text,
                        _passwordController.text,
                      );
                    },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            backgroundColor: Colours.primary,
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Primary Bid',
                          style: Styles.screenTitle,
                        ),
                        LoginTextField(
                          textEditingController: _usernameController,
                          label: 'Username',
                          enabled: !state.isLoading,
                        ),
                        Visibility(
                          visible: state.showInvalidUsernameMessage,
                          child: Text(
                            state.invalidUsernameMessage,
                            style: Styles.errorMessage,
                          ),
                        ),
                        LoginTextField(
                          textEditingController: _passwordController,
                          label: 'Password',
                          enabled: !state.isLoading,
                        ),
                        Visibility(
                          visible: state.showInvalidPasswordMessage,
                          child: Text(
                            state.invalidPasswordMessage,
                            style: Styles.errorMessage,
                          ),
                        ),
                        // TODO: Could these be combined? One widget with a message.
                        Visibility(
                          visible: state.isAuthFailure,
                          child: const Text(
                            'Bad credentials. \nTry: username: mor_2314 password: 83r5^_',
                            style: Styles.errorMessage,
                          ),
                        ),
                        Visibility(
                          visible: state.isNetworkFailure,
                          child: const Text(
                            'Check network connection.',
                            style: Styles.errorMessage,
                          ),
                        ),
                        Visibility(
                          visible: state.isOtherFailure,
                          child: const Text(
                            'Something went wrong. Please try again.',
                            style: Styles.errorMessage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    required TextEditingController textEditingController,
    required String label,
    required bool enabled,
    super.key,
  })  : _textEditingController = textEditingController,
        _label = label,
        _enabled = enabled;

  final TextEditingController _textEditingController;
  final String _label;
  final bool _enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: TextField(
        enabled: _enabled,
        controller: _textEditingController,
        decoration: InputDecoration(
          labelText: _label,
          labelStyle: const TextStyle(color: Colors.white),
        ),
        cursorColor: Colours.accent,
      ),
    );
  }
}
