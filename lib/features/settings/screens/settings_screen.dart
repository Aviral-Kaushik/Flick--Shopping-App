import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
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

  Widget accountSettingsOptionsListLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: appPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          settingsOptionTitle(Icons.account_box_rounded, "Account"),

          const SizedBox(height: appPadding,),

          settingsOptionListTile("Edit Profile", () => null, false),

          const SizedBox(height: appPadding,),

          settingsOptionListTile(
              "Your Addresses",
              () => Navigator.pushNamed(context, "/addressesScreen",
                  arguments: {'showUIForSelectAddressScreen': false}),
              false),

          const SizedBox(height: appPadding,),

          settingsOptionListTile("Change Password", () => null, false),

          const SizedBox(height: appPadding,),

          settingsOptionListTile("Privacy", () => null, false),

        ],
      ),
    );
  }

  Future<User?> getUserData() async {
    return await User.instance;
  }

  Widget notificationSettingsOptionsListLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          settingsOptionTitle(
              Icons.circle_notifications_rounded, "Notification"),

          const SizedBox(height: appPadding,),

          settingsOptionListTile("Notification", () {
            setState(() {
              notificationSwitchSelected = !notificationSwitchSelected;
            });
          }, true),

          const SizedBox(height: appPadding,),

          settingsOptionListTile("Updates on mail", () {
            setState(() {
              updatesOnMailSwitchSelected = !updatesOnMailSwitchSelected;
            });
          }, true),
        ],
      ),
    );
  }

  Widget othersSettingsOptionsListLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          settingsOptionTitle(Icons.miscellaneous_services_sharp, "Others"),

          const SizedBox(height: appPadding,),

          settingsOptionListTileWith2Titles("Language", "English"),

          const SizedBox(height: appPadding,),

          settingsOptionListTileWith2Titles("Region", "India"),
        ],
      ),
    );
  }

  Widget settingsOptionListTile(
      String optionTitle, Function()? onPressed, bool showSwitch) {
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
                activeSwitchBorder: Border.all(color: Colors.grey.withOpacity(0.9), width: 1.0),
                inactiveSwitchBorder: Border.all(color: Colors.grey.withOpacity(0.9), width: 1.0),
                onToggle: (val) {
                  onPressed!();
                },
              ),

            ],
          );
  }

  Widget settingsOptionTitle(IconData iconData, String title) {
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

  Widget settingsOptionListTileWith2Titles(String primaryText, String secondaryText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        settingsOptionListTile(primaryText, () => null, false),

        Container(
          width: 90,
          padding: const EdgeInsets.symmetric(horizontal: appPadding, vertical: appPadding / 4),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(color: Colors.grey.withOpacity(0.9), width: 1.0)
          ),
          child: Center(
            child: Text(
              secondaryText,
              style: GoogleFonts.poppins(
                color: Colors.grey.withOpacity(0.9),
                fontSize: 14
              ),
            ),
          ),
        )

      ],
    );
  }

  Widget settingsWidget(User user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: appPadding),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Profile Photo
          Padding(
            padding: const EdgeInsets.only(left: appPadding),
            child: SizedBox(
              width: 52,
              height: 52,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CircleAvatar(
                  backgroundColor: btnYellowBackground,
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 2),
                    child: Text(user.name[0],
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w800)
                    ),
                  ),
                ),
              ),
            ),
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
            height: appPadding * 2.5,
          ),

          // Notification Settings Options
          notificationSettingsOptionsListLayout(),

          const SizedBox(
            height: appPadding * 2.5,
          ),

          // Others Settings Options
          othersSettingsOptionsListLayout()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: FutureBuilder<User?>(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data != null) {
                return settingsWidget(snapshot.data!);
              } else {
                return const Center(
                  child: Text("No User Found"),
                );
              }
            },
          )
        )
    );
  }
}
