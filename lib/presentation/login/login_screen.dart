import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}
