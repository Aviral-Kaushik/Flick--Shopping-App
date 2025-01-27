import 'package:flick/components/simple_header.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  const OrderSuccessfulScreen({super.key});

  Widget checkCircleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          padding: const EdgeInsets.all(appPadding * 3),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: whiteColor
          ),

          child: const Icon(
            Icons.check,
            color: Colors.green,
            size: 70,
          ),

        )

      ],
    );
  }

  Widget orderSuccessfulWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        checkCircleWidget(),

        const SizedBox(height: appPadding * 2,),

        Text("Order Placed!", style: GoogleFonts.lato(
          color: whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),

        const SizedBox(height: appPadding * 2,),

        Text("You will receive an email shortly.", style: GoogleFonts.lato(
          color: whiteColor,
          fontSize: 18,
        ),),

        const SizedBox(height: appPadding * 1.5,),

        Text("Continue Shopping!", style: GoogleFonts.lato(
          color: whiteColor,
          fontSize: 16,
        ),),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: green,
        body: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            children: [

              SimpleHeader(
                  title: "",
                  backgroundColor: green,
                  textColor: whiteColor,
                  borderColor: whiteColor,
                  onBackPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context, "/homeScreen", (Route<dynamic> route) => false,
                      arguments: {"defaultScreenIndex": 1});
                },
              ),

              const SizedBox(
                height: appPadding * 5,
              ),

              orderSuccessfulWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
