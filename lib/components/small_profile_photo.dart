import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallProfilePhoto extends StatelessWidget {
  const SmallProfilePhoto({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: appPadding),
      child: SizedBox(
        width: 52,
        height: 52,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CircleAvatar(
            backgroundColor: btnYellowBackground,
            child: Padding(
              padding: const EdgeInsets.all(appPadding / 2),
              child: Text(userName[0],
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      color: blackColor,
                      fontWeight: FontWeight.w800)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
