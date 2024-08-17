import 'package:flick/features/auth/widgets/auth_divider.dart';
import 'package:flick/features/auth/widgets/auth_text_field.dart';
import 'package:flick/features/auth/widgets/google_sign_in_button.dart';
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

  backButtonWidget() {
    return Container(
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
    );
  }

  forgotPasswordTextWidget() {
    return Row(
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
    );
  }

  loginButtonWidget() {
    return GestureDetector(
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
    );
  }

  doNotHaveAccountWidget() {
    return Row(
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
    );
  }

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

                backButtonWidget(),

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

                AuthTextField(
                    labelText: "Enter your email",
                    isPasswordField: false,
                    onTextChanged: (String currentEmail) {

                    },
                    textEditingController: emailController),

                const SizedBox(height: appPadding * 1.5,),

                AuthTextField(
                    labelText: "Enter your password",
                    isPasswordField: true,
                    onTextChanged: (String currentPassword) {},
                    textEditingController: passwordController),

                const SizedBox(height: appPadding,),

                forgotPasswordTextWidget(),

                const SizedBox(height: appPadding * 2,),

                loginButtonWidget(),

                const SizedBox(height: appPadding / 2,),

                const AuthDividerWidget(showDividerForLoginScreen: true),

                const SizedBox(height: appPadding,),

                GoogleSignInButton(onPressed: () {}, isLoginButton: true),

                const Spacer(),

                doNotHaveAccountWidget(),
              ],
            ),
          ),
        )
    );
  }
}
