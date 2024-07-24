import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              padding: EdgeInsets.all(appPadding / 8),
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

  getCenterButtonsLayout() {
    return Padding(
        padding: const EdgeInsets.only(top: appPadding, left: appPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileButton("Your Orders"),

            profileButton("Favorite")
          ],
        )
    );
  }
  
  profileButton(String buttonTitle) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: vanillaButtonColor,
              side: BorderSide.none,
              shape: const StadiumBorder()),
          child: Text(
            buttonTitle,
            style: TextStyle(color: darkGreyButtonBackground),
          ),
        ),
    );
  }

  getProfileOptionsListLayout() {

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

              getCenterButtonsLayout(),

              const SizedBox(height: appPadding * 2,),

            ]
          )
        ),
      ),
    );
  }
}
