import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class SmallProfilePhoto extends StatelessWidget {
  const SmallProfilePhoto({super.key, required this.profilePhotoPath});

  final String profilePhotoPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: appPadding * 2),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: adminPanelPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(0.5),
              child: ClipOval(
                child: Image(
                    image: AssetImage(profilePhotoPath),
                    width: 40,
                    height: 40
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
