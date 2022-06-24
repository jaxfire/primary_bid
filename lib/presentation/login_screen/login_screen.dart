import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/app/injection_container.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/common/styles.dart';

import 'package:primary_bid/presentation/login_screen/cubit/login_cubit.dart';
import 'package:primary_bid/presentation/login_screen/cubit/state/login_state.dart';
import 'package:primary_bid/presentation/product_list_screen/widgets/login_text_field.dart';

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
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Primary Bid',
                          style: Styles.screenTitle,
                        ),
                        LoginTextField(
                          textEditingController: _usernameController,
                          label: 'Username',
                          enabled: !state.isLoading,
                          helperText: state.invalidUsernameMessage,
                        ),
                        LoginTextField(
                          textEditingController: _passwordController,
                          label: 'Password',
                          enabled: !state.isLoading,
                          helperText: state.invalidPasswordMessage,
                        ),
                        Text(
                          state.failureMessage,
                          style: Styles.errorMessage,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
            floatingActionButton: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colours.primary)),
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
          );
        },
      ),
    );
  }
}
