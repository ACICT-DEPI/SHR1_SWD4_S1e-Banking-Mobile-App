import 'package:flutter/material.dart';
import '../../../../../statistics/presentation/views/widgets/transaction_section.dart';
import '../../../../data/models/card_model.dart';
import 'widgets/bank_card_design.dart';
import 'widgets/build_actions_row.dart';
import 'widgets/home_page_app_bar.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  final List<Map<String, String>> cards = [
    {'cardNumber': '1234 5678 9012 3456', 'cardHolderName': 'John Doe', 'expiryDate': '12/24', 'cardType': 'visa', 'cvv': '455'},
    {'cardNumber': '5678 1234 9012 3456', 'cardHolderName': 'Jane Smith', 'expiryDate': '01/25', 'cardType': 'mastercard', 'cvv': '123'},
    // Add more card details here
  ];

  int pageIndex = 0;
  int selectedCardIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AppBar Section (Header remains fixed)
          HomePageAppBarDesign(
            username: "Tanya Myroniuk",
            imagePath: 'assets/images/person.png',
            onSearchPressed: () {
              // Your search logic here
            },
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                // Card Section
                Container(
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
                // Action buttons
                BuildActionsRow(
                  onPressedSent: () {},
                  onPressedReceive: () {},
                  onPressedLoan: () {},
                  onPressedTopUp: () {},
                ),
                const SizedBox(height: 26),
                // Transactions
                const TransactionSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
