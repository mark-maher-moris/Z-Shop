import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(@required String? message,Color? color) =>
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);

