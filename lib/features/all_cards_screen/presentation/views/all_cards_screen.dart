import 'package:bank_app/features/all_cards_screen/presentation/views/widgets/all_cards_screen_body.dart';
import 'package:flutter/material.dart';

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
