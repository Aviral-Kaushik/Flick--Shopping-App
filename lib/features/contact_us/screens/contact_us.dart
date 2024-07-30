import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

  headerAnimationWidget() {
    return Row(
      children: [
        Expanded(child: Lottie.asset("assets/animations/contact_us.json")),
      ],
    );
  }

  getInTouchCardWidget() {
    return Positioned(
      left: 40,
      right: 40,
      top: 250,

      child: Container(
        padding: const EdgeInsets.all(appPadding * 2),

        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(appPadding),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFF0000001A),
                  blurRadius: 10.0,
                  spreadRadius: 2.0)
            ]),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Get in Touch",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                        fontSize: 20))
              ],
            ),

            const SizedBox(
              height: appPadding,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "Name",
                alignLabelWithHint: true,
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: blackColor
                  ),
                  contentPadding: const EdgeInsets.all(appPadding / 4)
              ),
              controller: nameTextController,
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
            ),

            const SizedBox(
              height: appPadding,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                alignLabelWithHint: true,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: blackColor
                ),
                contentPadding: const EdgeInsets.all(appPadding / 4)
              ),
              controller: emailTextController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
            ),

            const SizedBox(
              height: appPadding,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "Message",
                alignLabelWithHint: true,
                  labelStyle:
                      GoogleFonts.poppins(fontSize: 14, color: blackColor),
                  contentPadding: const EdgeInsets.all(appPadding / 4)),
              controller: messageTextController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 20,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
            ),

            const SizedBox(
              height: appPadding * 2,
            ),

            sendButtonWidget(),
          ],
        ),
      ),
    );
  }

  sendButtonWidget() {
    return Container(
      width: 50,
      height: 50,
      // padding: const EdgeInsets.all(appPadding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.blueAccent),

      child: const Center(
        child: Icon(
          LineAwesomeIcons.telegram,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: primaryColor,

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Expanded(
                child: Stack(children: [
                  headerAnimationWidget(),

                  getInTouchCardWidget(),
                ]),

              ),
            ],
          )),
    );
  }
}
