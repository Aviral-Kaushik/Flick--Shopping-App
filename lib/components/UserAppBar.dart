import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget{
  const UserAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
          builder: (context) =>
              IconButton(
                icon: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.menu, color: Colors.black),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
