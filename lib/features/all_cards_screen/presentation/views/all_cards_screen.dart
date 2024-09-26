import 'package:flutter/material.dart';

import 'widgets/all_cards_screen_body.dart';

class AllCardsScreen extends StatelessWidget {
  const AllCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AllCardsScreenBody(),
      ),
    );
  }
}
