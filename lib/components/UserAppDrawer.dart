import 'package:flick/main.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class UserAppDrawer extends StatefulWidget {
  const UserAppDrawer({super.key});

  @override
  State<UserAppDrawer> createState() => _UserAppDrawerState();
}

class _UserAppDrawerState extends State<UserAppDrawer> {

  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _isAdmin = isAdmin;
    // User? user = await User.instance;
    //
    // if(Auth().currentUser != null) {
    //   isAdmin = (user != null) ? user.isAdmin : false;
    // } else {
    //   isAdmin = false;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkGreyButtonBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Image.asset(
                    "lib/images/nike.png",
                    color: whiteTextColor,
                  )),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(color: dividerColor,),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home, color: whiteTextColor),
                  title: Text(
                    "Home",
                    style: TextStyle(color: whiteTextColor),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () =>
                      Navigator.pushNamed(context, "/termsAndConditions"),
                  leading: Icon(
                    Icons.supervised_user_circle_outlined,
                    color: whiteTextColor,
                  ),
                  title: Text(
                    "Terms & Condition",
                    style: TextStyle(color: whiteTextColor),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () => Navigator.pushNamed(context, "/privacyPolicy"),
                  leading:
                      Icon(Icons.privacy_tip_outlined, color: whiteTextColor),
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(color: whiteTextColor),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.info, color: whiteTextColor),
                  title: Text(
                    "About",
                    style: TextStyle(color: whiteTextColor),
                  ),
                ),
              ),

              if (_isAdmin)
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    onTap: () => {
                      Navigator.pushNamed(context, "/adminPanel")
                    },
                    leading: Icon(Icons.admin_panel_settings_outlined, color: whiteTextColor),
                    title: Text(
                      "Admin Panel",
                      style: TextStyle(color: whiteTextColor),
                    ),
                  ),
                )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout, color: whiteTextColor),
              title: Text(
                "Sign out",
                style: TextStyle(color: whiteTextColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
