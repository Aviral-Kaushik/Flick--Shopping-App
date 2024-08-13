import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                    fontWeight: FontWeight.w600,
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
                        color: const Color(0xFFA6A6A6)
                    ),

                    contentPadding: const EdgeInsets.all(appPadding),
                    fillColor: const Color(0x33E5E4E2),
                    filled: true,

                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFF1F1F1), width: 1.0),
                      borderRadius: BorderRadius.circular(appPadding / 2),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFA6A6A6), width: 1.0),
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
                        color: const Color(0xFFA6A6A6)
                    ),

                    contentPadding: const EdgeInsets.all(appPadding),
                    fillColor: const Color(0x33E5E4E2),
                    filled: true,

                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFF1F1F1), width: 1.0),
                      borderRadius: BorderRadius.circular(appPadding / 2),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFA6A6A6), width: 1.0),
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
                      "Forgot Password?",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: blackColor!.withOpacity(0.9)
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: appPadding * 2,),

                GestureDetector(
                  onTap: () {
                    // TODO Implement login here
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: appPadding),
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(appPadding / 2)
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: whiteColor,
                          fontWeight: FontWeight.w400
                        )
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: appPadding / 2,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Expanded(
                        child: Divider(color: Colors.grey,
                            thickness: 1, height: 100)),

                    SizedBox(width: 6,),

                    Text("Or Login with", style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),),

                    SizedBox(width: 6,),

                    Expanded(
                        child: Divider(color: Colors.grey,
                            thickness: 1, height: 100)),
                  ],
                ),

                const SizedBox(height: appPadding,),

                Container(
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

                        Text("Sign in with Google", style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 14,
                        ),)
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 14,
                      ),
                    ),

                    Text(
                      " Register Now",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF00FFFF),
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
