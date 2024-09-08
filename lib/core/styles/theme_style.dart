import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeStyle {
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.greyF4),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.blue),
      ),
    ),
  );
}
