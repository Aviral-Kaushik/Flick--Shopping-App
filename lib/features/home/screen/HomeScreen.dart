import 'package:flick/components/UserAppDrawer.dart';
import 'package:flick/components/UserBottomNavigation.dart';
import 'package:flick/features/cart/screen/CartScreen.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: UserBottomNavigation(
        onTabChanged: (index) => navigateBottomNavBar(index),
      ),
      body: _bottomNavPages[_bottomNavSelectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )),
      ),
      drawer: const UserAppDrawer(),
    );
  }
}
