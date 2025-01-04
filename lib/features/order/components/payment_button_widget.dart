import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentButtonWidget extends StatelessWidget {
  const PaymentButtonWidget({super.key,
    required this.icon,
    required this.title,
    required this.onPressed});

  final IconData icon;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(appPadding),

        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.5,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(
              icon,
              color: Colors.blueAccent,
              size: 30,
            ),

            const SizedBox(
              width: 30,
            ),

            Text(title, style: GoogleFonts.lato(
              color: blackColor,
              fontWeight: FontWeight.w800,
              fontSize: 17
            ),)
          ],
        ),
      ),
    );
  }
}
