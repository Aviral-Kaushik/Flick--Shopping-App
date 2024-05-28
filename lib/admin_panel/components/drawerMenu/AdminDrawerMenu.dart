import 'package:flick/admin_panel/components/drawerMenu/widgets/AdminDrawerListTile.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class AdminDrawerMenu extends StatelessWidget {
  const AdminDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkGreyButtonBackground,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: DrawerHeader(
                child: Image.asset(
                  "assets/images/logowithtext.png",
                )),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(color: dividerColor,),
          ),

          AdminDrawerListTile(
              title: "Dash Board",
              icon: "assets/icons/Dashboard.svg",
              onTap: () {
                Navigator.pushNamed(context, "/adminPanel");
              }),

          AdminDrawerListTile(
              title: "Users",
              icon: "assets/icons/Users.svg",
              onTap: () {
                Navigator.pushNamed(context, "/adminUsersListScreen");
              }),

          AdminDrawerListTile(
              title: "Products",
              icon: "assets/icons/Message.svg",
              onTap: () {}),

          AdminDrawerListTile(
              title: "Referrals",
              icon: "assets/icons/Referrals.svg",
              onTap: () {
                Navigator.pushNamed(context, "/adminReferralsScreen");
              }),

          AdminDrawerListTile(
              title: "Messages",
              icon: "assets/icons/Messages.svg",
              onTap: () {}),

          AdminDrawerListTile(
              title: "Terms of Use",
              icon: "assets/icons/Policy.svg",
              onTap: () {
                Navigator.pushNamed(context, "/adminTermsAndCondition");
              }),

          AdminDrawerListTile(
              title: "Privacy Policy",
              icon: "assets/icons/Policy.svg",
              onTap: () {
                Navigator.pushNamed(context, "/adminPrivacyPolicyScreen");
              }),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(color: dividerColor,),
          ),

          AdminDrawerListTile(
              title: "Settings",
              icon: "assets/icons/Setting.svg",
              onTap: () {}),

          AdminDrawerListTile(
              title: "Logout",
              icon: "assets/icons/Logout.svg",
              onTap: () {}),
        ],
      ),
    );
  }
}
