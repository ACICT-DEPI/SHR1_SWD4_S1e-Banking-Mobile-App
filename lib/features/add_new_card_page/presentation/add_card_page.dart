import 'package:flutter/material.dart';

import 'widgets/add_card_screen_body.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddCardScreenBody(),
      ),
    );
  }
}
