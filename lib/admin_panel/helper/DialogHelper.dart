import 'package:flick/admin_panel/components/widgets/dialogs/ProgressDialog.dart';
import 'package:flutter/material.dart';

class DialogHelper {

  // TODO Use this dialog for showing progress dialog everywhere
  void showProgressDialog(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return PopScope(
              canPop: false,
              child: ProgressDialog(message: message)
          );
        }
    );
  }
}