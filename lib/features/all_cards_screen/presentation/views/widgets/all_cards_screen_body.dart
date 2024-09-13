import 'package:bank_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../add_new_card_page/presentation/add_card_page.dart';
import '../../../../navigation_screen/data/models/card_model.dart';
import '../../../../navigation_screen/presentation/home/presentation/views/widgets/bank_card_design.dart';

class AllCardsScreenBody extends StatefulWidget {
  const AllCardsScreenBody({super.key});

  @override
  State<AllCardsScreenBody> createState() => _AllCardsScreenBodyState();
}

class _AllCardsScreenBodyState extends State<AllCardsScreenBody> {
  final List<Map<String, String>> cards = [
    {
      'cardNumber': '1234 5678 9012 3456',
      'cardHolderName': 'John Doe',
      'expiryDate': '12/24',
      'cardType': 'visa',
      'cvv': '455'
    },
    {
      'cardNumber': '1234 5678 9012 3456',
      'cardHolderName': 'John Doe',
      'expiryDate': '12/24',
      'cardType': 'visa',
      'cvv': '455'
    },
    // Add more card details here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
      child: Column(
        children: [
          CustomAppBar(
            appBarTitle: "All Cards",
            leftIcon: Icons.arrow_back_ios_new_outlined,
            onPressedLeft: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return BankCardDesign(
                    card: CardModel(
                  cvv: cards[index]['cvv'].toString(),
                  cardNumber: cards[index]['cardNumber'].toString(),
                  cardHolderName: cards[index]['cardHolderName'].toString(),
                  expiryDate: cards[index]['expiryDate'].toString(),
                  cardType: cards[index]['cardType'].toString(),
                ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomAppButton(
              title: 'Add Card',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddCardScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
