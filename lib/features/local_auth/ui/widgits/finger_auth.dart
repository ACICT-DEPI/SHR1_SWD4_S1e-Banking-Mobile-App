import 'package:flutter/material.dart';

class FingerprintAuth extends StatelessWidget {
  final Future<void> Function() onAuthenticate;

  const FingerprintAuth({super.key, required this.onAuthenticate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAuthenticate,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(16.0),
            child: const Icon(
              Icons.fingerprint,
              size: 45,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Forgot PIN Text Widget
class ForgotPinText extends StatelessWidget {
  const ForgotPinText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //       context.go(Routing.loginView);
        /// create new PIN view
        ///
      },
      child: Text(
        'Forgot PIN?',
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 16,
        ),
      ),
    );
  }
}
