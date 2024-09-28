import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/features/local_auth/ui/widgits/finger_auth.dart';
import 'package:bank_app/features/local_auth/ui/widgits/logo.dart';
import 'package:bank_app/features/local_auth/ui/widgits/number_pad.dart';
import 'package:bank_app/features/local_auth/ui/widgits/pin_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

import '../../../core/Routing/Routing.dart';

// Main Auth Screen
class LocalAuthScreen extends StatefulWidget {
  @override
  _LocalAuthScreenState createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  final LocalAuthentication _auth = LocalAuthentication();
  String enteredPin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(),
            SizedBox(height: 20),
            PinCircles(enteredPin: enteredPin),
            SizedBox(height: 40),
            NumberPad(
              onNumberTapped: (number) {
                setState(() {
                  _handleNumberTap(number);
                });
              },
            ),
            SizedBox(height: 20),
            FingerprintAuth(
              onAuthenticate: _authenticateWithBiometrics,
            ),
            SizedBox(height: 20),
            ForgotPinText(),
          ],
        ),
      ),
    );
  }

  void _handleNumberTap(String number) {
    if (number == "Del") {
      if (enteredPin.isNotEmpty) {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      }
    } else if (enteredPin.length < 6) {
      enteredPin += number;
    }

    if (enteredPin.length == 6) {
      if (enteredPin == '123456') { // Replace '123456' with your actual PIN
        context.go(Routing.navigationScreen);

      } else {
        print('Incorrect PIN');
        enteredPin = ''; // Clear the entered PIN
      }
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    try {
      bool authenticated = await _auth.authenticate(
        localizedReason: 'Please authenticate to access',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (authenticated) {
        context.go(Routing.navigationScreen);
      } else {
        print('Authentication failed');
      }
    } catch (e) {
      print(e);
    }
  }

}


