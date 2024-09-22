import 'package:flutter/material.dart';

import 'widgets/success_sending_screen_body.dart';

class SuccessSendingScreen extends StatelessWidget {
  const SuccessSendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SuccessSendingScreenBody(),
      ),
    );
  }
}
