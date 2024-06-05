import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class SuccessfulAndErrorDialog extends StatelessWidget {
  const SuccessfulAndErrorDialog(
      {super.key,
      required this.title,
      required this.description,
      required this.buttonText,
      this.showUIForErrorDialog});

  final String title, description, buttonText;
  final bool? showUIForErrorDialog;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appPadding)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: successfulDialogContent(context),
    );
  }

  successfulDialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[

        Container(
          padding: const EdgeInsets.only(
              top: avatarRadius + appPadding,
              bottom: appPadding,
              left: appPadding,
              right: appPadding),
          margin: const EdgeInsets.only(top: avatarRadius),

          decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(appPadding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Text(
                title,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.w700),
              ),

              const SizedBox(
                height: 16.0,
              ),

              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),

              const SizedBox(
                height: 24.0,
              ),

              Align(
                alignment: Alignment.bottomRight,
                child:  GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.only(
                    top: appPadding / 2,
                    bottom: appPadding / 2),

                    margin: const EdgeInsets.all(appPadding),

                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(24)
                    ),

                    child: Center(
                      child: Text(buttonText, style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: whiteColor
                        ),
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),

        Positioned(
          left: appPadding,
          right: appPadding,
          child: CircleAvatar(
            backgroundColor: (showUIForErrorDialog != null && showUIForErrorDialog!)
                ? Colors.redAccent : Colors.blueAccent,
            radius: avatarRadius,
            child: Icon((showUIForErrorDialog != null && showUIForErrorDialog!)
                ? Icons.error_outline_sharp : Icons.done, color: whiteColor, size: 40,),
          ),
        ),
      ],
    );
  }
}
