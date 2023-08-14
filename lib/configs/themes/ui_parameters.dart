import 'package:flutter/material.dart';

class UIParameters {
  // 是否处于深色模式
  static bool isDarkMode(BuildContext context) {
    // 判断当前所处模式
    return Theme.of(context).brightness == Brightness.dark;
  }
}
