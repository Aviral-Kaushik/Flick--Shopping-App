import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key,
    required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appPadding)
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: progressDialogContent(context),
    );
  }

  progressDialogContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      padding: const EdgeInsets.all(appPadding),

      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(appPadding),
        shape: BoxShape.rectangle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0)
          )
        ]
      ),

      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const SizedBox(
              height: appPadding * 2,
            ),

            Center(
              child: CircularProgressIndicator(
                backgroundColor: whiteColor,
                valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
                strokeWidth: 7,
              ),
            ),

            const SizedBox(
              height: appPadding,
            ),

            Center(
              child: Text(message, style: const TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
            ),

            const SizedBox(
              height: appPadding * 2,
            ),
          ],
        ),
      ),
    );
  }
}
