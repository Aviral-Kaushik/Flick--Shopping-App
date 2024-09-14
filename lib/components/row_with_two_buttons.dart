import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
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
              child: GestureDetector(
                onTap: onFirstButtonPressed,
                child: Container(
                    padding: const EdgeInsets.only(
                        top: appPadding / 2,
                        bottom: appPadding / 2),

                    decoration: BoxDecoration(
                        color: firstButtonColor,
                        borderRadius: BorderRadius.circular(appPadding / 2),
                        border: Border.all(color: Colors.black12)
                    ),

                    child: Center(
                      child: Text(firstBtnTitle, style: TextStyle(
                          fontSize: 15,
                          color: blackColor
                      ),
                      ),
                    )
                ),
              ),
            )),

        const SizedBox(
          width: 8,
        ),

        Expanded(
          child: GestureDetector(
            onTap: onSecondButtonPressed,
            child: Container(
                padding: const EdgeInsets.only(
                    top: appPadding / 2,
                    bottom: appPadding / 2),

                decoration: BoxDecoration(
                    color: secondButtonColor,
                    borderRadius: BorderRadius.circular(appPadding / 2)
                ),

                child: Center(
                  child: Text(secondBtnTitle, style: TextStyle(
                      fontSize: 15,
                      color: whiteColor
                  ),
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }
}
