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
              onTap: () {}),

          AdminDrawerListTile(
              title: "Blog Post",
              icon: "assets/icons/BlogPost.svg",
              onTap: () {}),

          AdminDrawerListTile(
              title: "Message",
              icon: "assets/icons/Message.svg",
              onTap: () {}),

          AdminDrawerListTile(
              title: "Statistics",
              icon: "assets/icons/Statistics.svg",
              onTap: () {}),

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