import 'package:bank_app/features/onboardingScreen/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'core/styles/theme_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyle.lightThemeData,
      home: const OnboardingScreen(),
    );
  }
}
