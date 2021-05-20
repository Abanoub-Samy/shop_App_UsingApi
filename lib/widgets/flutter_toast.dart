import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  required Color backgroundColor,
  required Color textColor,
  double fontSize = 16,
  Toast toastLength = Toast.LENGTH_LONG,
  ToastGravity gravity = ToastGravity.BOTTOM,
  int timeToShow = 3,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: timeToShow,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: fontSize,
  );
}
