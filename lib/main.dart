import 'package:bank_app/features/authentication/data/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/Routing/Routing.dart';
import 'core/network/firebase.dart';
import 'core/styles/theme_style.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeStyle.lightThemeData,
      debugShowCheckedModeBanner: false,
      routerConfig: Routing.router,
    );
  }
}
