import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../../../navigation_screen/presentation/home/presentation/views/widgets/bank_card_design.dart';
import 'send_id_textfield.dart';
import 'send_mony_text_field.dart';

class SendMoneyScreenBody extends StatefulWidget {
  const SendMoneyScreenBody({super.key});

  @override
  State<SendMoneyScreenBody> createState() => _SendMoneyScreenBodyState();
}

class _SendMoneyScreenBodyState extends State<SendMoneyScreenBody> {
  int selectedCardIndex = 0;
  TextEditingController idController = TextEditingController();
  TextEditingController amountController = TextEditingController();
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
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          CustomAppBar(
            appBarTitle: "Send Money",
            leftIcon: Icons.arrow_back_ios_new_outlined,
            onPressedLeft: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 35),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
              const SizedBox(height: 30),
              SendIdTextField(textController: idController),
              const SizedBox(height: 10),
              SendMoneyTextField(textController: amountController),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomAppButton(
              title: 'Send Money',
              onPressed: () {
                print(idController.text +
                    " mony  " +
                    amountController.text +
                    " " +
                    cards[selectedCardIndex]['cardNumber'].toString());
              },
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
