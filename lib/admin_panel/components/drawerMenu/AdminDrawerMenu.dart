import 'package:flick/admin_panel/components/drawerMenu/widgets/AdminDrawerListTile.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class AdminDrawerMenu extends StatelessWidget {
  const AdminDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(appPadding),
            child: Image.asset('assets/images/logowithtext.png'),
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

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
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
