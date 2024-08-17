import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/Colors.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton(
      {super.key, required this.onPressed, required this.isLoginButton});

  final bool isLoginButton;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(appPadding),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(appPadding / 2),
            border: Border.all(color: const Color(0xFFA6A6A6),
                width: 1.0)
        ),

        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset("assets/images/google.png",
                height: 30, width: 30,),

              const SizedBox(width: 24,),

              Text(
                isLoginButton ? "Sign in with Google" : "Sign up with Google",
                style: GoogleFonts.poppins(
                  color: blackColor,
                fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
