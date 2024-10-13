import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllReviewsHeader extends StatelessWidget {
  const AllReviewsHeader(
      {super.key,
        required this.backButtonPressed});

  final Function() backButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        GestureDetector(
          onTap: backButtonPressed,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(appPadding * 2),
                border: Border.all(color: Colors.black)
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: appPadding / 2, vertical: appPadding),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: blackColor,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: appPadding,),

        Text(
          "All Reviews",
          style: GoogleFonts.raleway(
              color: blackColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
