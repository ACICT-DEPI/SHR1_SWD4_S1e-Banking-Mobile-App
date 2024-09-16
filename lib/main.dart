import 'package:bank_app/features/onboardingScreen/presentation/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/Routing/Routing.dart';
import 'core/styles/theme_style.dart';

import 'features/add_new_card_page/presentation/add_card_page.dart';
import 'features/navigation_screen/presentation/navigation.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeStyle.lightThemeData,
      debugShowCheckedModeBanner: false,
      routerConfig: Routing.router,
    );
  }
}
