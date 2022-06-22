import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:primary_bid/features/login/login_remote_data_source.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Login'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final login = LoginRemoteDataSourceImpl(client: http.Client());

          final username = Username('mor_2314');
          final password = Password('83r5^_');

          final result = await login.login(username: username, password: password);
          result.either(
            (failure) => print('failure: $failure'),
            (authToken) => 'authToken: $authToken',
          );
        },
      ),
    );
  }
}
