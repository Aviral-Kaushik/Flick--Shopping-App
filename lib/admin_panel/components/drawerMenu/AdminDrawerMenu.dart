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
              isSvgImage: true,
              onTap: () {
                Navigator.pushNamed(context, "/adminPanel");
              }),

          AdminDrawerListTile(
              title: "Users",
              icon: "assets/icons/Subscribers.svg",
              isSvgImage: true,
              onTap: () {
                Navigator.pushNamed(context, "/adminUsersListScreen");
              }),

          AdminDrawerListTile(
              title: "Products",
              icon: "assets/icons/Message.svg",
              isSvgImage: false,
              tileIcon: const Icon(Icons.shopping_cart_outlined,
                  color: adminPanelPrimaryColor),
              onTap: () {}),

          AdminDrawerListTile(
              title: "Referrals",
              icon: "assets/icons/Referrals.svg",
              isSvgImage: false,
              tileIcon: const Icon(Icons.share_outlined,
                  color: adminPanelPrimaryColor),
              onTap: () {
                Navigator.pushNamed(context, "/adminReferralsScreen");
              }),

          AdminDrawerListTile(
              title: "Messages",
              icon: "assets/icons/Message.svg",
              isSvgImage: true,
              onTap: () {
                Navigator.pushNamed(context, "/adminMessagesScreen");
              }),

          AdminDrawerListTile(
              title: "Terms of Use",
              icon: "assets/icons/Policy.svg",
              isSvgImage: false,
              tileIcon: const Icon(Icons.terminal_sharp,
                  color: adminPanelPrimaryColor),
              onTap: () {
                Navigator.pushNamed(context, "/adminTermsAndCondition");
              }),

          AdminDrawerListTile(
              title: "Privacy Policy",
              icon: "assets/icons/Policy.svg",
              isSvgImage: false,
              tileIcon: const Icon(Icons.policy_rounded,
                  color: adminPanelPrimaryColor),
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
              isSvgImage: true,
              onTap: () {
                Navigator.pushNamed(context, "/adminSettingsScreen");
              }),

          AdminDrawerListTile(
              title: "Logout",
              icon: "assets/icons/Logout.svg",
              isSvgImage: true,
              onTap: () {}),
        ],
      ),
    );
  }
}
