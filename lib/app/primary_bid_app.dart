import 'package:flutter/material.dart';
import 'package:primary_bid/app/route_generator.dart';
import 'package:primary_bid/presentation/categories_screen/categories_screen.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/login_screen/login_screen.dart';

class PrimaryBidApp extends StatelessWidget {
  const PrimaryBidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Mukta',
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colours.accent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colours.accent),
          ),
        ),
      ),
      // initialRoute: LoginScreen.routeName, // TODO: Change back to login
      initialRoute: CategoriesScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
