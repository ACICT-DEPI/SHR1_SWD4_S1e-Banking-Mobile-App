import 'package:bank_app/features/navigation_screen/presentation/cards_screen/widgets/spending_limit_section.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../all_cards_screen/presentation/views/all_cards_screen.dart';
import '../../../statistics/presentation/views/widgets/transaction_section.dart';
import '../../data/models/card_model.dart';
import '../home/presentation/views/widgets/bank_card_design.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int selectedCardIndex = 0;

  PageController pageController = PageController();

  final List<Map<String, String>> cards = [
    {
      'cardNumber': '1234 5678 9012 3456',
      'cardHolderName': 'John Doe',
      'expiryDate': '12/24',
      'cardType': 'visa',
      'cvv': '455'
    },
    {
      'cardNumber': '5678 1234 9012 3456',
      'cardHolderName': 'Jane Smith',
      'expiryDate': '01/25',
      'cardType': 'mastercard',
      'cvv': '123'
    },
    // Add more card details here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AppBar Section (Header remains fixed)
          CustomAppBar(
            appBarTitle: "My Cards",
            rightIcon: Icons.add,
            onPressedRight: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllCardsScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                // Card Section
                SizedBox(
                  width: double.infinity, // Adjust to your needs
                  height: 220,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BankCardDesign(
                          card: CardModel(
                            cvv: card['cvv']!,
                            cardNumber: card['cardNumber']!,
                            cardHolderName: card['cardHolderName']!,
                            expiryDate: card['expiryDate']!,
                            cardType: card['cardType']!,
                          ),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        selectedCardIndex = index;
                      });
                    },
                  ),
                ),

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
