import 'package:bank_app/features/authentication/presentation/views/login_view.dart';
import 'package:bank_app/features/authentication/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'core/styles/theme_style.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/home/presentation/views/widgets/home_view_body.dart';
import 'features/onboardingScreen/ui/OnboardingScreen.dart';
import 'features/statistics/presentation/views/statistics_view.dart';
import 'features/transaction_history/presentation/views/transaction_history.dart';
import 'features/transaction_history/presentation/views/widgets/transaction_history_body.dart';

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
      home:  StatisticsView(),
    );
  }
}
