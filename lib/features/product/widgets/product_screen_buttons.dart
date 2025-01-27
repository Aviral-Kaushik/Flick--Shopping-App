import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ProductScreenButtons extends StatelessWidget {
  const ProductScreenButtons(
      {super.key,
      required this.buttonText,
      required this.onActionPerformed,
      required this.showAddToCartButton,
      this.enabled});

  final String buttonText;
  final Function() onActionPerformed;
  final bool showAddToCartButton;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      borderRadius: 50,
      elevation: 0,
      innerColor: showAddToCartButton ? Colors.black : Colors.amber,
      outerColor: showAddToCartButton ? Colors.amber : Colors.black,
      alignment: showAddToCartButton ? Alignment.centerLeft : Alignment.centerRight,
      sliderButtonIcon: Icon(
        showAddToCartButton
            ? (enabled ?? true)
                ? Icons.shopping_bag_outlined
                : Icons.check
            : Icons.currency_rupee,
        color: Colors.white70,
        size: 25,
      ),
      text: buttonText,
      enabled: enabled ?? true,
      sliderRotate: false,
      textStyle: GoogleFonts.poppins(
          color: whiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      onSubmit: () async {
        onActionPerformed();
        return Future.value();
      },
    );
  }
}
