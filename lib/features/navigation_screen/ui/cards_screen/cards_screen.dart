import 'package:bank_app/features/navigation_screen/ui/cards_screen/widgets/spending_limit_section.dart';
import 'package:bank_app/features/navigation_screen/ui/cards_screen/widgets/cards_screen_Header.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/core/styles/colors.dart';
import '../../../statistics/presentation/views/widgets/transaction_section.dart';
import '../../repo/models/card_model.dart';
import '../home/presentation/views/widgets/bank_card_design.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AppBar Section (Header remains fixed)
          CardsPageHeader(),
          Expanded(
            child: ListView(
              children: [
                // Card Section
                BankCardDesign(card: CardModel(
                  cvv: "123",
                  cardNumber: "1234 5678 9012 3456",
                  cardHolderName: "Tanya Myroniuk",
                  expiryDate: "09/24",
                  cardType: "Mastercard",
                )),

                const SizedBox(height: 20),
                // Transactions Section
                const TransactionSection(),
                // Spending Limit Section
                SpendingLimitSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
