

import 'package:flutter/material.dart';
import 'package:search_recipe_app_getx/utils/app_context.dart';


class MySnackbar {
  static Future showSnackbar(
    String msg, {
    int durationMS = 1500,
    Color bgColor = Colors.red,
    Color msgColor = Colors.white,
    TextStyle? msgStyle,
  }) async {
    ScaffoldMessenger.of(GlobalContext.currentContext!).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: durationMS),
        content: Text(msg, style: TextStyle(color: msgColor,fontSize: 20,fontWeight: FontWeight.w400),
            // TextStyle(
            //   color: msgColor,
            // ),
            ),
        backgroundColor: bgColor,
      ),
    );
  }
}