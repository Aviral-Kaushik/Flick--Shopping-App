import 'package:flick/components/simple_button.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class RowWithTwoButtonsWidget extends StatelessWidget {
  const RowWithTwoButtonsWidget(
      {super.key,
      required this.firstBtnTitle,
      required this.secondBtnTitle,
      required this.onFirstButtonPressed,
      required this.onSecondButtonPressed,
      required this.firstButtonColor,
      required this.secondButtonColor});

  final String firstBtnTitle;
  final String secondBtnTitle;
  final Function() onFirstButtonPressed;
  final Function() onSecondButtonPressed;
  final Color firstButtonColor;
  final Color secondButtonColor;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Center(
              child: SimpleButton(
                buttonText: firstBtnTitle,
                backgroundColor: firstButtonColor,
                onPressed: onFirstButtonPressed,
                textColor: blackColor,
                showBorder: true,
              ),
        )),
        const SizedBox(
          width: 8,
        ),

        Expanded(
          child: SimpleButton(
              buttonText: secondBtnTitle,
              backgroundColor: secondButtonColor,
              onPressed: onSecondButtonPressed),
        ),
      ],
    );
  }
}
