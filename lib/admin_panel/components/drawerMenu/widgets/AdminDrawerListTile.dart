import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminDrawerListTile extends StatelessWidget {
  const AdminDrawerListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title, icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(
          icon,
          color: adminPanelPrimaryColor,
          height: 20,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
