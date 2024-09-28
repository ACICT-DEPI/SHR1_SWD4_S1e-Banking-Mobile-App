import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeStyle {
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.black),
        backgroundColor: WidgetStatePropertyAll(AppColors.greyF4),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.blue),
      ),
    ),
  );
  static ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black, // Set a dark background color
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.grey94), // Darker grey for icons
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.dark), // Darker shade of blue
      ),
    ),
  );

}
