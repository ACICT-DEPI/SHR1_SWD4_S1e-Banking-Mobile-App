import 'package:flutter/material.dart';

import 'widgets/receive_money_view_body.dart';

class ReceiveMoneyView extends StatelessWidget {
  const ReceiveMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ReceiveMoneyViewBody(),
      ),
    );
  }
}
