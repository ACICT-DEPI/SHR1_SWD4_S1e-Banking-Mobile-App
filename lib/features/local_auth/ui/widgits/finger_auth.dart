import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              color: Colors.greenAccent,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.fingerprint,
              size: 40,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Use Fingerprint to Log In',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
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
    return Text(
      'Forgot PIN?',
      style: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 16,
      ),
    );
  }
}
