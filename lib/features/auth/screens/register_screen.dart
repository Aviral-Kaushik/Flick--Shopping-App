import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick/services/firebase_services.dart';
import 'package:flick/data/database/hive_database.dart';
import 'package:flick/data/session/session_manager.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  FirebaseServices firebaseServices = locator.get<FirebaseServices>();

  HiveDatabase hiveDatabase = locator.get<HiveDatabase>();
  SessionManager sessionManager = locator.get<SessionManager>();

  late DialogHelper dialogHelper;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String errorMessage = "";
  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);
  }

  Future<void> createUserWithEmailAndPassword() async {
    showProgressDialog("Registering! Please Wait");

    try {
      await Auth().createUserWithEmailAndPassword(
          emailController.text,
          passwordController.text
      );
      postUserDataToFirebase();
    } on FirebaseAuthException catch (e) {
      debugPrint("Error During Registering at firebase: ${e.message}");
      setState(() {
        errorMessage = e.message ?? "";
        showErrorDialog("Something Went Wrong! Please Try Again later");
      });
    }
  }

  void postUserDataToFirebase() async {
    bool userCreatedSuccessfully = await firebaseServices.createNewUser(getNewUserData());
    if (!userCreatedSuccessfully) {
      showErrorDialog("Cannot Register at this moment!");
    } else {
      // TODO Redirect to specific screen
      SnackBarHelper().showSnackBar(context, "Registration Successful");
      fetchAndStoreUserDataInLocalDatabase();
    }
  }

  void fetchAndStoreUserDataInLocalDatabase() async {
    flick_user.User? userData = await getUserDataFromFirebase();

    if (userData != null) {
      hiveDatabase.storeUsersData(userData);
      sessionManager.storeUsernameInSessionStorage(userData.name);
    }

    dismissAllDialog();
  }

  Future<flick_user.User?> getUserDataFromFirebase() async {
    flick_user.User? user = await firebaseServices.getUserDataFromMail(emailController.text);
    if (user == null) {
      debugPrint("User Details not fetched from firebase");
      showErrorDialog("Cannot fetch data at this moment");
    }
    return user;
  }

  flick_user.User getNewUserData() {
    return flick_user.User(id: "1",
        username: usernameController.text,
        password: passwordController.text,
        email: emailController.text,
        name: usernameController.text,
        device: Platform.isAndroid ? "Android" : "iOS",
        isAdmin: false,
        joiningDate: DateTime.now().toString(),
        profilePhoto: "",
        country: "India"
    );
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

  registerButtonWidget() {
    return GestureDetector(
      onTap: () {
        createUserWithEmailAndPassword();
        },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: appPadding),
        decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(appPadding / 2)
        ),
        child: Center(
          child: Text(
              "Register",
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

  haveAccountTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Already have account? ",
          style: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 14,
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/loginScreen");
          },
          child: Text(
            " Login Now",
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

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(appPadding * 1.5),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              backButtonWidget(),

              const SizedBox(height: appPadding * 1.5,),

              Text(
                "Hello! Register to get\nstarted",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: blackColor
                ),
              ),

              const SizedBox(height: appPadding * 1.5,),

              AuthTextField(
                  labelText: "Full Name",
                  isPasswordField: false,
                  onTextChanged: (String currentEmail) {
                    usernameController.text = currentEmail;
                  },
                  textEditingController: usernameController),

              const SizedBox(height: appPadding * 1.5,),

              AuthTextField(
                  labelText: "Email",
                  isPasswordField: false,
                  onTextChanged: (String currentEmail) {
                    emailController.text = currentEmail;
                  },
                  textEditingController: emailController),

              const SizedBox(height: appPadding * 1.5,),

              AuthTextField(
                  labelText: "Password",
                  isPasswordField: true,
                  onTextChanged: (String currentPassword) {
                    passwordController.text = currentPassword;
                  },
                  textEditingController: passwordController),

              const SizedBox(height: appPadding * 1.5,),

              AuthTextField(
                  labelText: "Confirm Password",
                  isPasswordField: true,
                  onTextChanged: (String currentPassword) {
                    confirmPasswordController.text = currentPassword;
                  },
                  textEditingController: confirmPasswordController),

              const SizedBox(height: appPadding * 2,),

              registerButtonWidget(),

              const AuthDividerWidget(showDividerForLoginScreen: false),

              GoogleSignInButton(onPressed: () {}, isLoginButton: false),

              const SizedBox(height: appPadding,),

              haveAccountTextWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
