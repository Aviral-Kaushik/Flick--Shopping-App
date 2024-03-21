import 'package:flick/components/user_bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _bottomNavSelectedIndex = 0;

  void navigateBottomNavBar(int index) {
    setState(() {
      _bottomNavSelectedIndex = index;
    });
  }

  final List<Widget> _bottomNavPages = [
    // const ShopPage(),
    // const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UserBottomNavigation(
        onTabChanged: (index) => navigateBottomNavBar(index),
      ),
    );
  }
}
