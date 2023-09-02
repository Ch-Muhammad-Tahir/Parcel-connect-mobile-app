import 'package:flutter/material.dart';

class AppHelperFunction {
  static void showToast(String text, BuildContext context) {
    var scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: "Okay",
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ));
  }
}
