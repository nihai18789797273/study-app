import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

mixin SubThemeData {
  // 主题字体
  TextTheme getTextThemes() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  // 图标主题颜色
  IconThemeData getIconTheme() {
    return const IconThemeData(color: onSurfaceTextColor, size: 16);
  }
}
