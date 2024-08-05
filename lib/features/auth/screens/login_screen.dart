import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.all(appPadding * 1.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  padding: const EdgeInsets.all(appPadding / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(appPadding / 2),
                    border: Border.all(color: Colors.black.withOpacity(0.7))
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: blackColor,
                  ),
                ),

                const SizedBox(height: appPadding * 2,),

                Text(
                  "Welcome Back! Glad \n to see you, Again!",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: blackColor
                  ),
                ),

                const SizedBox(height: appPadding * 3,),

                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter your email",
                    alignLabelWithHint: true,
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: blackColor
                    ),
                    contentPadding: const EdgeInsets.all(appPadding),
                    fillColor: const Color(0xFFf7f8f9),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(appPadding / 2),
                    ),
                  ),
                  controller: emailController,
                  textCapitalization: TextCapitalization.words,
                ),

                const SizedBox(height: appPadding * 1.5,),

                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    alignLabelWithHint: true,
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: blackColor
                    ),
                    contentPadding: const EdgeInsets.all(appPadding),
                    fillColor: const Color(0xFFf7f8f9),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(appPadding / 2),
                    ),
                  ),
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),

                const SizedBox(height: appPadding,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      "Forgot Password",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: blackColor!.withOpacity(0.5)
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
