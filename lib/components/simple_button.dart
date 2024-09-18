import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {super.key,
      required this.buttonText,
      required this.backgroundColor,
      required this.onPressed,
      this.textColor,
      this.showBorder});

  final String buttonText;
  final Color backgroundColor;
  final Function() onPressed;
  final Color? textColor;
  final bool? showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
              vertical: appPadding / 2),

          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(appPadding / 2),
              border: (showBorder != null && showBorder!)
                  ? Border.all(color: Colors.black12)
                  : null),

          child: Center(
            child: Text(buttonText, style: TextStyle(
                fontSize: 15,
                color: textColor ?? whiteColor
              ),
            ),
          )
      ),
    );
  }
}
