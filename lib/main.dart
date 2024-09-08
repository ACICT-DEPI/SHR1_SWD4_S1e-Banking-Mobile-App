import 'package:flutter/material.dart';

import 'core/styles/theme_style.dart';
import 'features/transaction_history/presentation/views/transaction_history.dart';

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
      home: const TransactionHistory(),
    );
  }
}
