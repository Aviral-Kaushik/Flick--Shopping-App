import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../utils/Colors.dart';

class UserBottomNavigation extends StatelessWidget {
  const UserBottomNavigation({super.key, required this.onTabChanged, this.defaultIndex});

  final void Function(int)? onTabChanged;
  final int? defaultIndex;

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
        selectedIndex: defaultIndex ?? 0,
        onTabChange: (value) => onTabChanged!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: "Cart",
          ),
          GButton(
            icon: LineAwesomeIcons.user_circle,
            text: "Profile",
          )
        ],
      ),
    );
  }
}
