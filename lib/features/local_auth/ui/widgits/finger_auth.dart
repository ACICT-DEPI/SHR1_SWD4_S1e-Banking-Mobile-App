import 'package:bank_app/core/Routing/Routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FingerprintAuth extends StatelessWidget {
  final Future<void> Function() onAuthenticate;

  const FingerprintAuth({Key? key, required this.onAuthenticate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAuthenticate,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(16.0),
            child: Icon(
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(Routing.loginView);
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
