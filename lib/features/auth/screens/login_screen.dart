import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick/admin_panel/services/firebase_services.dart';
import 'package:flick/features/auth/widgets/auth_divider.dart';
import 'package:flick/features/auth/widgets/auth_text_field.dart';
import 'package:flick/features/auth/widgets/google_sign_in_button.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/helper/SnackbarHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/User.dart' as flick_user;
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flick/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late DialogHelper dialogHelper;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorMessage = "";
  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);
  }

  Future<void> signInWithEmailAndPassword() async {
    showProgressDialog("Please Wait1 Signing In");
    try {
      await Auth().signInWithEmailAndPassword(
          emailController.text,
          passwordController.text
      );
      if (Auth().currentUser != null) {
        getUserDataFromFirebase();
      } else {
        showErrorDialog("Invalid Credentials");
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("Error During Login at firebase: ${e.message}");
      setState(() {
        errorMessage = e.message ?? "";
        showErrorDialog("Invalid Credentials");
      });
    }
  }

  void getUserDataFromFirebase() async {
    FirebaseServices firebaseServices = locator.get<FirebaseServices>();

    flick_user.User? user = await firebaseServices.getUserDataFromMail(emailController.text);
    if (user == null) {
      debugPrint("User Details not fetched from firebase");
      showErrorDialog("Cannot fetch data at this moment");
    } else {
      // TODO Redirect to specific screen
      dismissAllDialog();
      debugPrint("User Details fetched from firebase: ${user.toFirestore()}");
      SnackBarHelper().showSnackBar(context, "Login Successful");
    }
  }

  backButtonWidget() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
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
        signInWithEmailAndPassword();
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

  doNotHaveAccountTextWidget() {
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

        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/registerScreen");
          },
          child: Text(
            " Register Now",
            style: GoogleFonts.poppins(
              color: const Color(0xFF00FFFF),
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }

  void showProgressDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  void showErrorDialog(String message) {
    if (isAnyDialogShowing) {
      dismissAllDialog();
    }
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog("Oops!", message, "Dismiss", true,
            () {
          isAnyDialogShowing = false;
        });
  }

  void dismissAllDialog() {
    if (isAnyDialogShowing) {

      isAnyDialogShowing = false;

      Navigator.pop(context);
    }
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
                  "Welcome Back! Glad\nto see you, Again!",
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
                      emailController.text = currentEmail;
                    },
                    textEditingController: emailController),

                const SizedBox(height: appPadding * 1.5,),

                AuthTextField(
                    labelText: "Enter your password",
                    isPasswordField: true,
                    onTextChanged: (String currentPassword) {
                      passwordController.text = currentPassword;
                    },
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

                doNotHaveAccountTextWidget(),
              ],
            ),
          ),
        )
    );
  }
}
