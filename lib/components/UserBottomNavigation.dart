import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/Colors.dart';

class UserBottomNavigation extends StatelessWidget {

  void Function(int)? onTabChanged;

  UserBottomNavigation({super.key, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: bottomNavSelectedBackgroundColor,
        activeColor: bottomNavSelectedBackgroundColor,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: bottomNavBackgroundColor,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        gap: 8,
        onTabChange: (value) => onTabChanged!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: "Cart",
          )
        ],
      ),
    );
  }
}
