import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for TextInputFormatter

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_app_button.dart';
import '../../navigation_screen/data/models/card_model.dart';
import '../../navigation_screen/presentation/home/presentation/views/widgets/bank_card_design.dart';
import 'Widgets/card_input_field.dart';
import 'Widgets/card_number_Input_formatter.dart';
import 'Widgets/date_input_formatter.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppBar(
                  appBarTitle: 'Add New Card',
                  leftIcon: Icons.arrow_back_ios_new_outlined,
                  onPressedLeft: () {
                    Navigator.pop(context);
                  },
                ),
                BankCardDesign(
                    card: CardModel(
                  cvv: _cvvController.text,
                  cardNumber: _cardNumberController.text,
                  cardHolderName: _cardHolderNameController.text,
                  expiryDate: _expiryDateController.text,
                  cardType: "Mastercard ",
                )),
                // Custom Credit Card Widget
                const SizedBox(height: 10),
                // Cardholder Name Section
                CardInputField(
                  keyboardType: TextInputType.name,
                  label: 'Cardholder Name',
                  icon: Icons.person,
                  controller: _cardHolderNameController,
                  onChanged: ubdateCardInfo,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16)
                  ], // Limit length to 16
                ),
                const SizedBox(height: 4),

                // Expiry Date and CVV Section
                Row(
                  children: [
                    Expanded(
                      child: CardInputField(
                        keyboardType: TextInputType.number,
                        label: 'Expiry Date',
                        icon: Icons.calendar_today,
                        controller: _expiryDateController,
                        onChanged: ubdateCardInfo,
                        inputFormatters: [
                          DateInputFormatter()
                        ], // Custom formatter for date
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: CardInputField(
                        keyboardType: TextInputType.number,
                        label: 'CVV',
                        icon: Icons.lock,
                        controller: _cvvController,
                        onChanged: ubdateCardInfo,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3)
                        ], // Limit length to 3
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Card Number Section
                CardInputField(
                  keyboardType: TextInputType.number,
                  label: 'Card Number',
                  icon: Icons.credit_card,
                  controller: _cardNumberController,
                  showCardIcons: true,
                  onChanged: ubdateCardInfo,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(19),
                    // Limit length to 19 characters (16 digits + 3 spaces)
                    CardNumberInputFormatter(),
                  ],
                ),
                const SizedBox(height: 80),
                CustomAppButton(
                  title: 'Add Card ',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ubdateCardInfo(String value) {
    setState(() {}); // Update the UI with new card details
  }
}
