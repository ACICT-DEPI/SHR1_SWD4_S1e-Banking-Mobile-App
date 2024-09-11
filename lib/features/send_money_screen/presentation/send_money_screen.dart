import 'package:bank_app/features/send_money_screen/presentation/widgets/send_id_textfield.dart';
import 'package:bank_app/features/send_money_screen/presentation/widgets/send_mony_screen_appbar.dart';
import 'package:bank_app/features/send_money_screen/presentation/widgets/send_mony_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';
import '../../../core/styles/texts_style.dart';
import '../../../core/widgets/custom_app_button.dart';
import '../../navigation_screen/data/models/card_model.dart';
import '../../navigation_screen/presentation/home/presentation/views/widgets/bank_card_design.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  int selectedCardIndex = 0;
  TextEditingController idController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  PageController pageController = PageController();
  final List<Map<String, String>> cards = [
    {'cardNumber': '1234 5678 9012 3456', 'cardHolderName': 'John Doe', 'expiryDate': '12/24', 'cardType': 'visa', 'cvv': '455'},
    {'cardNumber': '5678 1234 9012 3456', 'cardHolderName': 'Jane Smith', 'expiryDate': '01/25', 'cardType': 'mastercard', 'cvv': '123'},
    // Add more card details here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:SendMoneyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity, // Adjust to your needs
                  height: 300,
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
                SendIdTextField(textController: idController),
                SizedBox(height: 10),
                SendMonyTextField(textController: amountController),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomAppButton(
                title: 'Send Money',
                onPressed: () {
                  print(idController.text+" mony  "+amountController.text+" "+cards[selectedCardIndex]['cardNumber'].toString());
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
