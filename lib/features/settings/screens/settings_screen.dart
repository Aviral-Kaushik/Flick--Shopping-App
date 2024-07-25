import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool notificationSwitchSelected = true;
  bool updatesOnMailSwitchSelected = false;

  accountSettingsOptionsListLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: appPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          // Row(
          //   children: [
          //     const Icon(
          //       Icons.account_box_rounded,
          //       color: adminPanelPrimaryColor,
          //       size: 30,
          //     ),
          //
          //     const SizedBox(width: appPadding,),
          //
          //     Text(
          //       "Account",
          //         style: GoogleFonts.poppins(
          //             color: adminPanelPrimaryColor,
          //             fontSize: 22,
          //             fontWeight: FontWeight.w500)
          //     )
          //   ],
          // ),

          settingsOptionTitle(Icons.account_box_rounded, "Account"),

          const SizedBox(height: appPadding,),

          settingOptionText("Edit Profile", () => null, false),

          const SizedBox(height: appPadding,),

          settingOptionText("Your Addresses", () => null, false),

          const SizedBox(height: appPadding,),

          settingOptionText("Change Password", () => null, false),

          const SizedBox(height: appPadding,),

          settingOptionText("Privacy", () => null, false),

        ],
      ),
    );
  }

  notificationSettingsOptionsListLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          settingsOptionTitle(
              Icons.circle_notifications_rounded, "Notification"),

          const SizedBox(height: appPadding,),

          settingOptionText("Notification", () {
            setState(() {
              notificationSwitchSelected = !notificationSwitchSelected;
            });
          }, true),

          const SizedBox(height: appPadding,),

          settingOptionText("Updates on mail", () {
            setState(() {
              updatesOnMailSwitchSelected = !updatesOnMailSwitchSelected;
            });
          }, true),
        ],
      ),
    );
  }

  othersSettingsOptionsListLayout() {
    return Column();
  }

  settingOptionText(String optionTitle, Function()? onPressed, bool showSwitch) {
    bool selected;
    if (optionTitle == "Notification") {
      selected = notificationSwitchSelected;
    } else {
      selected = updatesOnMailSwitchSelected;
    }

    return !showSwitch
        ? GestureDetector(
            onTap: onPressed,
            child: Text(
              optionTitle,
              style: GoogleFonts.poppins(
                  color: blackColor, fontSize: 18, fontWeight: FontWeight.w400),
            ),

          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(optionTitle,
                  style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),

              FlutterSwitch(
                activeColor: const Color(0xfff3f3f3),
                inactiveColor: const Color(0xfff3f3f3),
                inactiveToggleColor: Colors.black,
                activeToggleColor: adminPanelPrimaryColor,
                width: 60.0,
                height: 30.0,
                toggleSize: 25.0,
                value: selected,
                borderRadius: 30.0,
                padding: 4.0,
                showOnOff: false,
                onToggle: (val) {
                  onPressed!();
                },
              ),

            ],
          );
  }

  settingsOptionTitle(IconData iconData, String title) {
    return Row(
      children: [

        Icon(
          iconData,
          color: adminPanelPrimaryColor,
          size: 30,
        ),

        const SizedBox(width: appPadding,),

        Text(
            title,
            style: GoogleFonts.poppins(
                color: adminPanelPrimaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w500)
        )
      ],
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

              const SizedBox(
                height: appPadding * 2,
              ),

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
