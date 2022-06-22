import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:primary_bid/injection_container.dart';
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
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.navigateTo.isNotEmpty) {
          Navigator.pushNamed(context, state.navigateTo);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Visibility(
                  visible: state.isLoading,
                  child: const CircularProgressIndicator(),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                Visibility(
                  visible: state.showInvalidUsernameMessage,
                  child: Text(state.invalidUsernameMessage),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                Visibility(
                  visible: state.showInvalidPasswordMessage,
                  child: Text(state.invalidPasswordMessage),
                ),
                Visibility(
                  visible: state.isAuthFailure,
                  child: const Text('Bad credentials. \n username: mor_2314 \n password: 83r5^_'),
                ),
                Visibility(
                  visible: state.isNetworkFailure,
                  child: const Text('Check network connection.'),
                ),
                Visibility(
                  visible: state.isOtherFailure,
                  child: const Text('Something went wrong. Please try again.'),
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.onLoginButtonClicked(
                      _usernameController.text,
                      _passwordController.text,
                    );
                  },
                  child: const Text('login'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
