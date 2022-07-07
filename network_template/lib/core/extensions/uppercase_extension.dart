import 'package:flutter/material.dart';

class Utils {
  static String? firstLetterToUpperCase(String string) {
    if (null != string) {
      return string[0].toUpperCase() + string.substring(1);
    }
    return null;
  }
}


