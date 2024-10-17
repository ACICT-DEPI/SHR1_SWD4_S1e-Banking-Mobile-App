import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../styles/texts_style.dart';
import 'custom_app_button.dart';
class ErrorScreenData {
  final String message;
  final Function() onPressed;

  ErrorScreenData({required this.message, required this.onPressed});
}
class ErrorScreen extends StatelessWidget {
  final String message;
  final Function()? onPressed;

  const ErrorScreen({super.key, required this.message, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/Animation - 1727028943609.json'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FittedBox(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextsStyle.textStyleSemiBold26,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomAppButton(
              title: "Try Again",
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
