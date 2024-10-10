import 'package:flick/admin_panel/components/widgets/dialogs/ProgressDialog.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/SuccessfulAndErrorDialog.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/WarningDialog.dart';
import 'package:flick/widgets/dialogs/AddReviewDialog.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  final BuildContext context;

  DialogHelper(this.context);

  void showProgressDialog(String message, Function()? afterDismissCallback) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return PopScope(
              canPop: false, child: ProgressDialog(message: message));
        }).then((value) => afterDismissCallback);
  }

  void showSuccessfulOrErrorDialog(
      String title,
      String description,
      String buttonText,
      bool showUiForErrorMessage,
      Function()? afterDismissCallBack) {
    showDialog(
        context: context,
        builder: (BuildContext context) => SuccessfulAndErrorDialog(
              title: title,
              description: description,
              buttonText: buttonText,
              showUIForErrorDialog: showUiForErrorMessage,
            )).then((value) => afterDismissCallBack);
  }

  void showWarningDialog(
      String message,
      String firstBtnTitle,
      String secondBtnTitle,
      Function() onPressed,
      Color firstButtonColor,
      Function()? afterDismissCallBack) {
    showDialog(
        context: context,
        builder: (BuildContext context) => WarningDialog(
              message: message,
              firstBtnTitle: firstBtnTitle,
              secondBtnTitle: secondBtnTitle,
              onPressed: onPressed,
              firstButtonColor: firstButtonColor,
            )).then((value) => afterDismissCallBack);
  }

  void showAddAReviewDialog(
      Function(int rating, String review) onRatingAndReviewSubmitted
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AddReviewDialog(
            onReviewAndRatingSubmitted: (int rating, String review) =>
                onRatingAndReviewSubmitted(rating, review)));
  }
}
