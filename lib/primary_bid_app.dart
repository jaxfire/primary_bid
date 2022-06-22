import 'package:flutter/material.dart';
import 'package:primary_bid/presentation/login_screen/login_screen.dart';

class PrimaryBidApp extends StatelessWidget {
  const PrimaryBidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( // TODO: Theme to PrimaryBid colours.
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}