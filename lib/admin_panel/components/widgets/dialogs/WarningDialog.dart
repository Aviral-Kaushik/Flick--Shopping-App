import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({super.key,
    required this.message,
    required this.firstBtnTitle,
    required this.secondBtnTitle,
    required this.onPressed,
    required this.firstButtonColor});

  final String message, firstBtnTitle, secondBtnTitle;
  final Function() onPressed;
  final Color firstButtonColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appPadding)
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: warningDialogContent(context),
    );
  }

  warningDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(appPadding),

      decoration: BoxDecoration(
        color: whiteColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(appPadding),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0)
          )
        ]
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Text(message, style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: textColor
          ),),

          const SizedBox(
            height: 24.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: appPadding / 2,
                                bottom: appPadding / 2),

                            decoration: BoxDecoration(
                                color: const Color(0xFFF0F0F0),
                                borderRadius: BorderRadius.circular(appPadding / 2)
                            ),

                            child: Center(
                              child: Text(secondBtnTitle, style: TextStyle(
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
                      onTap: onPressed,
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: appPadding / 2,
                              bottom: appPadding / 2),

                          decoration: BoxDecoration(
                              color: firstButtonColor,
                              borderRadius: BorderRadius.circular(appPadding / 2)
                          ),

                          child: Center(
                            child: Text(firstBtnTitle, style: TextStyle(
                                fontSize: 15,
                                color: whiteColor
                              ),
                            ),
                          )
                      ),
                    ),
                ),
            ],
          )

        ],
      ),
    );
  }
}
