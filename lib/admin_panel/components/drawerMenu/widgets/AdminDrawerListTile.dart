import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminDrawerListTile extends StatelessWidget {
  const AdminDrawerListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.isSvgImage,
      this.tileIcon});

  final String title, icon;
  final void Function() onTap;
  final bool isSvgImage;
  final Icon? tileIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        onTap: onTap,
        leading: isSvgImage ? SvgPicture.asset(
          icon,
          color: adminPanelPrimaryColor,
          height: 20,
        ) : ((tileIcon == null) ? const Icon(Icons.device_unknown) : tileIcon),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
