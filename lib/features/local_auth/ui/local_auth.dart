import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/Routing/Routing.dart';
import '../domain/biometric_auth.dart';
import 'widgits/finger_auth.dart';
import 'widgits/logo.dart';
import 'widgits/number_pad.dart';
import 'widgits/pin_input.dart';

// Main Auth Screen
class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({super.key});

  @override
  State<LocalAuthScreen> createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  //final LocalAuthentication _auth = LocalAuthentication();
  String enteredPin = "";

  @override
  void initState() {
    super.initState();
    BiometricAuth.authenticateWithBiometrics(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 20),
            PinCircles(enteredPin: enteredPin),
            const SizedBox(height: 40),
            NumberPad(
              onNumberTapped: (number) {
                setState(() {
                  _handleNumberTap(number);
                });
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const ForgotPinText(),
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
      if (enteredPin == '123456') {
        // Replace '123456' with your actual PIN
        context.go(Routing.navigationScreen);
      } else {
        print('Incorrect PIN');
        enteredPin = ''; // Clear the entered PIN
      }
    }
  }
}
