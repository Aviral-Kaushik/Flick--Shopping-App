import 'package:flick/components/simple_button.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutBottomCard extends StatelessWidget {
  const CheckoutBottomCard(
      {super.key,
      required this.checkoutButtonText,
      required this.totalPrice,
      required this.onCheckoutButtonPressed});

  final String checkoutButtonText;
  final String totalPrice;
  final Function() onCheckoutButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(appPadding),

      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Total: ", style: GoogleFonts.lato(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),

              const SizedBox(width: 5,),

              Text(
                  "₹$totalPrice",
                  style: GoogleFonts.lato(
                    color: textColor,
                    fontSize: 20,
                  )
              ),
            ],
          ),

          const SizedBox(height: appPadding / 2,),

          SimpleButton(
              buttonText: checkoutButtonText,
              backgroundColor: Colors.black,
              onPressed: () => onCheckoutButtonPressed(),
              textColor: whiteColor,
              borderColor: whiteColor
          ),
        ],
      ),
    );
  }
}
