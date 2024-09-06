import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/flutter_toast_model.dart';

class CustomFlutterToast {
  static void showCustomFlutterToast(
      {required FlutterToastModel flutterToastModel}) {
    Fluttertoast.showToast(
        msg: flutterToastModel.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: flutterToastModel.backgroundColor,
        textColor: flutterToastModel.textColor ?? Colors.white,
        fontSize: 14.0);
  }

  static void cancelCustomFlutterToast() {
    Fluttertoast.cancel();
  }
}
