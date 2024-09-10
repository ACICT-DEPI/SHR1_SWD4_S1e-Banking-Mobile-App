import 'package:bank_app/features/navigation_screen/presentation/cards_screen/widgets/cards_screen_Header.dart';
import 'package:bank_app/features/navigation_screen/presentation/cards_screen/widgets/spending_limit_section.dart';
import 'package:flutter/material.dart';
import '../../../statistics/presentation/views/widgets/transaction_section.dart';
import '../../data/models/card_model.dart';
import '../home/presentation/views/widgets/bank_card_design.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AppBar Section (Header remains fixed)
          const CardsPageHeader(),
          const SizedBox(height: 30),
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
                const SpendingLimitSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
