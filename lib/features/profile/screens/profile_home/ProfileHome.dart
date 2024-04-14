import 'package:flick/features/profile/widgets/ProfileMenuWidget.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Header
              Stack(children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage("assets/images/photo1.jpg"))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: btnYellowBackground,
                    ),
                    child: Icon(
                      LineAwesomeIcons.alternate_pencil,
                      color: blackColor,
                    ),
                  ),
                ),
              ]),

              const SizedBox(
                height: 10,
              ),

              Text(
                "Avichal Kaushik",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              Text(
                "avichalkaushik0007@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: btnYellowBackground,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(
                    "Your Orders",
                    style: TextStyle(color: darkGreyButtonBackground),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Divider(),

              // Profile Menu Structure
              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPressed: () {},
              ),

              ProfileMenuWidget(
                title: "Billing Details",
                icon: LineAwesomeIcons.wallet,
                onPressed: () {},
              ),

              ProfileMenuWidget(
                title: "User Management",
                icon: LineAwesomeIcons.user_check,
                onPressed: () {},
              ),

              Divider(
                color: subTitleTextColor,
              ),

              const SizedBox(
                height: 10,
              ),

              ProfileMenuWidget(
                title: "Information",
                icon: LineAwesomeIcons.info,
                onPressed: () {},
              ),

              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: red,
                endIcon: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
