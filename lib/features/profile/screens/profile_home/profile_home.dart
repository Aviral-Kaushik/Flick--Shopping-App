import 'package:flick/components/simple_button.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flick/utils/auth.dart';
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

  User? _user;

  /// Next Tasks
  /// When user is not logged in show login & sing up button in place of
  /// profile options.
  /// Look where ever profile photo must be replaced with avatar.
  /// Fetch Products from the backend.

  Future<bool> _checkUserLoggedIn() async {
    _user = await User.instance;
    _user = null;
    return _user != null; // Assuming null means not logged in
  }

  Widget profileHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding, left: appPadding),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (_user == null || _user!.profilePhoto.isNotEmpty)
            const CircleAvatar(
              radius: 56,
              backgroundColor: adminPanelPrimaryColor,
              child: Padding(
                padding: EdgeInsets.all(appPadding / 16),
                child: ClipOval(
                  child: Image(image: AssetImage("assets/images/photo8.jpg")),
                ),
              ),
            )
          else
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CircleAvatar(
                  backgroundColor: btnYellowBackground,
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 2),
                    child: Text(_user!.name[0],
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w800)
                    ),
                  ),
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
                  _user?.name ?? "Avichal Kaushik",
                  style: GoogleFonts.poppins(
                      color: adminPanelPrimaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w800),
                ),

                Text(
                  _user?.username ?? "@avichal_1106",
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

  Widget profileCenterButtonsLayout() {
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
                onPressed: () {
                  Navigator.pushNamed(context, "/favouritesProductScreen");
                },

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

  Widget profileMenuOptionsListLayout() {
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

          profileMenuWidget(_user != null ? "Sign out" : "Log In", LineAwesomeIcons.alternate_sign_out,
              false, "", () {
                if (_user != null) {
                  Auth().signOut();
                }

                Navigator.pushNamed(context, "/loginScreen");
              }),

        ],
      ),
    );
  }

  Widget profileMenuWidget(String title, IconData icon, bool showAssetIcon, String iconAssetPath, Function() onPressed) {
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

  Widget userProfileWidget() {
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

  Widget userNotLoggedInWidget() {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(appPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        border: Border.all(color: Colors.black)
                    ),
                    child: Icon(Icons.person, size: 100, color: blackColor)),

                const SizedBox(height: appPadding * 4),

                Text("You are not logged in!",
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: adminPanelPrimaryColor
                    )
                ),

                const SizedBox(height: appPadding * 2),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: appPadding * 3),
                  child: SimpleButton(
                      buttonText: "Have an account? Log in!",
                      backgroundColor: Colors.black,
                      textColor: whiteColor,
                      onPressed: () {
                        Navigator.pushNamed(context, "/loginScreen");
                      }
                  ),
                ),

                const SizedBox(height: appPadding * 1.5),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: appPadding * 3),
                  child: SimpleButton(
                      buttonText: "Create an account! Register",
                      backgroundColor: Colors.white,
                      textColor: blackColor,
                      showBorder: true,
                      borderColor: blackColor,
                      onPressed: () {
                        Navigator.pushNamed(context, "/registerScreen");
                      }
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _checkUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show loading state
          } else if (snapshot.hasData && snapshot.data == true) {
            return userProfileWidget(); // User is logged in
          } else {
            return userNotLoggedInWidget(); // User is not logged in
          }
        },
    );
  }
}
