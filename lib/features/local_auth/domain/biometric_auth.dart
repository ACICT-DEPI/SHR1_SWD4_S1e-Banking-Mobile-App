import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../core/Routing/Routing.dart';

class BiometricAuth {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<void> authenticateWithBiometrics(BuildContext context) async {
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
