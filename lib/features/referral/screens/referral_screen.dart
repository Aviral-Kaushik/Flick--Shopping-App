import 'package:flick/components/small_profile_photo.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {

  referralScreenHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        const SmallProfilePhoto(
            profilePhotoPath: "assets/images/photo8.jpg"),

        const SizedBox(width: appPadding,),

        Text("Tell Your Friends", style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: blackColor
        ),)

      ],
    );
  }

  referralScreenTitleAndSubTitleWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Center(
          child: Text(
            "Flick .", style: GoogleFonts.caveat(
              fontSize: 60,
              fontWeight: FontWeight.w800,
              color: blackColor,
              fontStyle: FontStyle.italic
          ),
          ),
        ),

        const SizedBox(height: appPadding / 2,),

        Center(
          child: Text("Just Do It!", style: GoogleFonts.caveat(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: blackColor,
              fontStyle: FontStyle.italic
          ),),
        )

      ],
    );
  }

  referAppsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        shareAppIconWidget(
            "assets/images/referrals_apps/facebook.png"),

        shareAppIconWidget("assets/images/referrals_apps/x.png"),

        shareAppIconWidget(
            "assets/images/referrals_apps/linkedin.png"),

        shareAppIconWidget("assets/images/referrals_apps/others.png"),

      ],
    );
  }

  orDividerWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: appPadding * 2),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(
              child: Divider(color: Colors.grey, thickness: 1, height: 100)),

          SizedBox(width: 4,),

          Text("Or", style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),),

          SizedBox(width: 4,),

          Expanded(
              child: Divider(color: Colors.grey, thickness: 1, height: 100)),
        ],
      ),
    );
  }

  copyLinkWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: appPadding, horizontal: appPadding * 3),

            decoration: BoxDecoration(
              color: const Color(0xffFFF8DC).withOpacity(0.5),
              borderRadius: BorderRadius.circular(appPadding),
              // border: Border.all(color: Colors.black, width: 1.0)
            ),
            // color: primaryColor?.withOpacity(0.7),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  "https://aviralkaushik.epizy.com",
                  style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),


                const SizedBox(
                  height: appPadding,
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greenButtonColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: Text(
                      "Copy Link",
                      style: GoogleFonts.roboto(color: whiteTextColor),
                      // style: TextStyle(color: whiteTextColor),
                    ),
                  ),
                ),

              ],
            ),
          )),
      ],
    );
  }

  shareAppIconWidget(String appIconPath) {
    return Image.asset(
      appIconPath,
      width: 30,
      height: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: appPadding),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              referralScreenHeaderWidget(),

              const SizedBox(height: appPadding * 2,),

              referralScreenTitleAndSubTitleWidget(),

              const SizedBox(height: appPadding * 13,),

              referAppsWidget(),

              const SizedBox(height: appPadding,),

              orDividerWidget(),

              const SizedBox(height: appPadding,),

              copyLinkWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
