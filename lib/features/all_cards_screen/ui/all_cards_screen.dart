import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for TextInputFormatter

import '../../../core/widgets/custom_app_button.dart';
import '../../navigation_screen/repo/models/card_model.dart';
import '../../navigation_screen/ui/home/presentation/views/widgets/bank_card_design.dart';

class AllCardsScreen extends StatefulWidget {
  const AllCardsScreen({super.key});

  @override
  _AllCardsScreenState createState() => _AllCardsScreenState();
}

class _AllCardsScreenState extends State<AllCardsScreen> {
  final List<Map<String, String>> cards = [
    {'cardNumber': '1234 5678 9012 3456', 'cardHolderName': 'John Doe', 'expiryDate': '12/24', 'cardType': 'visa', 'cvv': '455'},
    {'cardNumber': '1234 5678 9012 3456', 'cardHolderName': 'John Doe', 'expiryDate': '12/24', 'cardType': 'visa', 'cvv': '455'},
    // Add more card details here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Add New Card',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return  BankCardDesign(card: CardModel(
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
                // Add your button action here
              },
            ),
          ),
        ],
      ),
    );
  }
}
