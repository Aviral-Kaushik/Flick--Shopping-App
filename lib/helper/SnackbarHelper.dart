import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

import '../../utils/Colors.dart';

class SnackBarHelper {

  void showSnackBar(BuildContext context, String message) {

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: blackColor,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(appPadding),
    ));

  }

}