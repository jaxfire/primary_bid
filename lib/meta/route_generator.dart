import 'package:flutter/material.dart';
import 'package:primary_bid/presentation/categories_screen/categories_screen.dart';
import 'package:primary_bid/presentation/login_screen/login_screen.dart';
import 'package:primary_bid/presentation/product_list_screen/product_list_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case CategoriesScreen.routeName:
        return MaterialPageRoute(builder: (context) => const CategoriesScreen());
      case ProductListScreen.routeName:
        return MaterialPageRoute(
            builder: (context) =>
                ProductListScreen(categoryName: args as String)); // TODO: Double check this. Can we make it better?
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found!'),
          ),
        );
      },
    );
  }
}
