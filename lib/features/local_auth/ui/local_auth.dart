import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/Routing/Routing.dart';
import '../../../core/widgets/Loading_screen.dart';
import '../../settings/data/models/settings_model.dart';
import '../../settings/domain/cubits/settings_cubit.dart';
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
  String enteredPin = "";

  @override
  void initState() {
    super.initState();
    BiometricAuth.authenticateWithBiometrics(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsSuccess) {
          SettingsModel settingsModel = state.settingsModel;
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
                        _handleNumberTap(
                          number,
                          settingsModel.appPassword.toString(),
                        );
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
        } else {
          return const LoadingScreen();
        }
      },
    );
  }

  void _handleNumberTap(String number, String password) {
    if (number == "Del") {
      if (enteredPin.isNotEmpty) {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      }
    } else if (enteredPin.length < 6) {
      enteredPin += number;
    }

    if (enteredPin.length == 6) {
      if (enteredPin == password) {
        // Replace '123456' with your actual PIN
        context.go(Routing.navigationScreen);
      } else {
        print('Incorrect PIN');
        enteredPin = ''; // Clear the entered PIN
      }
    }
  }
}
