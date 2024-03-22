import 'package:flick/components/user_bottom_navigation.dart';
import 'package:flick/features/cart/screen/CartScreen.dart';
import 'package:flick/features/shop/screen/ShopScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _bottomNavSelectedIndex = 0;

  void navigateBottomNavBar(int index) {
    setState(() {
      _bottomNavSelectedIndex = index;
    });
  }

  final List<Widget> _bottomNavPages = [
    const ShopScreen(),
    const CartScreen(),
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
