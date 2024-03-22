import 'package:flick/features/cart/screen/CartScreen.dart';
import 'package:flick/features/home/screen/HomeScreen.dart';
import 'package:flick/features/intro/IntroScreen.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/introScreen":
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case "/homeScreen":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/cartScreen":
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case "/shopScreen":
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route found for  ${settings.name}')),
                ));
    }
  }
}
