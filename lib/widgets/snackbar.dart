import 'package:flutter/material.dart';

class MyMessageHandler {
  static void showSnackBar(var _scaffoldkey, String message) {
    _scaffoldkey.currentState!.hideCurrentSnackBar();
    _scaffoldkey.currentState!.showSnackBar((SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ))));
  }
}
