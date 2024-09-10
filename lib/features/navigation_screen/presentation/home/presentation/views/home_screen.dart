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
  int pageIndex = 0;

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
