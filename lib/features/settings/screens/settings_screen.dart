import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  accountSettingsOptionsListLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: appPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            children: [
              const Icon(
                Icons.account_box_rounded,
                color: adminPanelPrimaryColor,
                size: 30,
              ),

              const SizedBox(width: appPadding,),

              Text(
                "Account",
                  style: GoogleFonts.poppins(
                      color: adminPanelPrimaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)
              )
            ],
          ),

          const SizedBox(height: appPadding,),

          settingOptionText("Edit Profile", () => null),

          const SizedBox(height: appPadding,),

          settingOptionText("Your Addresses", () => null),

          const SizedBox(height: appPadding,),

          settingOptionText("Change Password", () => null),

          const SizedBox(height: appPadding,),

          settingOptionText("Privacy", () => null),

        ],
      ),
    );
  }

  notificationSettingsOptionsListLayout() {
    return Column();
  }

  othersSettingsOptionsListLayout() {
    return Column();
  }

  settingOptionText(String optionTitle, Function()? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        optionTitle,
        style: GoogleFonts.poppins(
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: appPadding),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Profile Photo
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: appPadding * 2),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: adminPanelPrimaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(0.5),
                        child: ClipOval(
                          child: Image(
                              image: AssetImage("assets/images/photo8.jpg"),
                              width: 40,
                              height: 40
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: appPadding * 2,
              ),

              // Settings Text
              Padding(
                padding: const EdgeInsets.only(left: appPadding * 2),
                child: Text("Settings",
                    style: GoogleFonts.poppins(
                        color: adminPanelPrimaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w500)),
              ),

              const SizedBox(
                height: appPadding * 1.5,
              ),

              // Account Settings Options
              accountSettingsOptionsListLayout(),

              // Notification Settings Options
              notificationSettingsOptionsListLayout(),

              // Others Settings Options
              othersSettingsOptionsListLayout()
            ],
          ),
        ),
      ),
    );
  }
}
