import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleHeader extends StatelessWidget {
  const SimpleHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(appPadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(appPadding / 2),
                border: Border.all(color: Colors.black)
            ),
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20,),
          ),
        ),

        const SizedBox(
          width: appPadding * 2,
        ),

        Text(title, style: GoogleFonts.lato(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 17
        ),)

      ],
    );
  }
}
