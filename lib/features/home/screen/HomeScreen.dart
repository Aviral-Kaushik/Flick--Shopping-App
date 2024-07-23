import 'package:flick/components/UserAppBar.dart';
import 'package:flick/components/UserAppDrawer.dart';
import 'package:flick/components/UserBottomNavigation.dart';
import 'package:flick/features/cart/screen/CartScreen.dart';
import 'package:flick/features/profile/screens/profile_home/ProfileHome.dart';
import 'package:flick/features/shop/screen/ShopScreen.dart';
import 'package:flick/utils/Colors.dart';
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
    const ProfileHome()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: UserBottomNavigation(
        onTabChanged: (index) => navigateBottomNavBar(index),
      ),
      body: _bottomNavPages[_bottomNavSelectedIndex],
      appBar: const UserAppBar(),
      drawer: const UserAppDrawer(),
    );
  }
}
