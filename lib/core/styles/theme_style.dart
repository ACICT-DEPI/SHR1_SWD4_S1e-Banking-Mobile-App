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
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(double.infinity),
            ),
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(AppColors.blue),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(color: AppColors.white),
        ),
      ),
    ),
  );
}
