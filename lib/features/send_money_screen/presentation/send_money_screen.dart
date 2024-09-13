import 'package:flutter/material.dart';

import 'widgets/send_money_screen_body.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SendMoneyScreenBody(),
      ),
    );
  }
}
