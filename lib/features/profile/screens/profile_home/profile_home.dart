import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {

  profileHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding, left: appPadding),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const CircleAvatar(
            radius: 56,
            backgroundColor: adminPanelPrimaryColor,
            child: Padding(
              padding: EdgeInsets.all(appPadding / 16),
              child: ClipOval(
                child: Image(image: AssetImage("assets/images/photo8.jpg")),
              ),
            ),
          ),

          const SizedBox(width: appPadding),

          Padding(
            padding: const EdgeInsets.only(top: appPadding),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Text(
                  "Avichal Kaushik",
                  style: GoogleFonts.poppins(
                      color: adminPanelPrimaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w800),
                ),

                Text(
                  "@avichal_1106",
                  style: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.3),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  profileCenterButtonsLayout() {
    return Padding(
        padding: const EdgeInsets.only(top: appPadding, left: appPadding / 2),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                    backgroundColor: greenButtonColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),

                child: Text(
                  "Your Orders",
                  style: GoogleFonts.roboto(color: whiteTextColor),
                  // style: TextStyle(color: whiteTextColor),
                ),
              ),
            ),

            SizedBox(
              width: 150,
              child: OutlinedButton(
                onPressed: () {},

                style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(side: BorderSide(
                      color: greenButtonColor,
                      width: 1.0
                    ))),

                child: Text(
                  "Favourite",
                  style: GoogleFonts.roboto(color: darkGreyButtonBackground),
                ),
              ),
            ),

          ],
        )
    );
  }

  profileMenuOptionsListLayout() {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding, left: appPadding / 2),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          profileMenuWidget(
              "Upcoming Sales", LineAwesomeIcons.shopping_basket, false, "",
              () {
            Navigator.pushNamed(context, "/loginScreen");
          }),

          const SizedBox(
            height: 4.0,
          ),

          profileMenuWidget(
              "Tell Your Friends", LineAwesomeIcons.share_square, false, "",
              () {
                Navigator.pushNamed(context, "/referralScreen");
          }),
          const SizedBox(
            height: 4.0,
          ),

          profileMenuWidget(
              "Settings", Icons.settings_outlined, false, "", () {
                Navigator.pushNamed(context, "/settingsScreen");
          }),

          const SizedBox(
            height: 4.0,
          ),

          profileMenuWidget("Promotions", LineAwesomeIcons.product_hunt, true,
              "assets/icons/Announcement.svg", () {
                Navigator.pushNamed(context, "/registerScreen");
              }),

          const SizedBox(
            height: 4.0,
          ),

          profileMenuWidget("Get In Touch", Icons.message_outlined, true,
              "assets/icons/ContactUs.svg", () {
                Navigator.pushNamed(context, "/contactUs");
              }),

          const SizedBox(
            height: 4.0,
          ),

          profileMenuWidget("Sign out", LineAwesomeIcons.alternate_sign_out,
              false, "", () {}),

        ],
      ),
    );
  }

  profileMenuWidget(String title, IconData icon, bool showAssetIcon, String iconAssetPath, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: appPadding, left: appPadding),

        child: Row(
          children: [

            showAssetIcon ? SvgPicture.asset(
              iconAssetPath,
              color: adminPanelPrimaryColor,
              height: 30,
            ) : Icon(
              icon,
              size: 30,
              color: brightBlueColor,
            ),

            const SizedBox(
              width: appPadding * 2,
            ),

            Text(
              title,
              style: GoogleFonts.lato(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              profileHeaderWidget(),

              const SizedBox(height: appPadding * 2,),

              profileCenterButtonsLayout(),

              const SizedBox(height: appPadding,),

              profileMenuOptionsListLayout(),

            ]
          )
        ),
      ),
    );
  }
}
