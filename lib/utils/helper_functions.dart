import 'dart:io';

import 'package:flutter/material.dart';

// To remove all html tags in string
String removeHtmlTags(String htmlString) {
  // Define a regular expression to match HTML tags
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  // Replace HTML tags with an empty string
  return htmlString.replaceAll(exp, '');
}

Size getDeviceSize(context) {
  return MediaQuery.of(context).size;
}

Future<bool> checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
