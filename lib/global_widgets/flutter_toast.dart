import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static getMyToast({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}