import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/network/firebase_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../../../navigation_screen/presentation/home/presentation/views/widgets/bank_card_design.dart';
import 'card_input_field.dart';
import 'card_number_Input_formatter.dart';
import 'date_input_formatter.dart';

class AddCardScreenBody extends StatefulWidget {
  const AddCardScreenBody({super.key});

  @override
  State<AddCardScreenBody> createState() => _AddCardScreenBodyState();
}

class _AddCardScreenBodyState extends State<AddCardScreenBody> {
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
    return Padding(
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
                cardType: "Mastercard",
              ),
            ),
            // Custom Credit Card Widget
            const SizedBox(height: 10),
            // Cardholder Name Section
            CardInputField(
              keyboardType: TextInputType.name,
              label: 'Cardholder Name',
              icon: Icons.person,
              controller: _cardHolderNameController,
              onChanged: updateCardInfo,
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
                    onChanged: updateCardInfo,
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
                    onChanged: updateCardInfo,
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
              onChanged: updateCardInfo,
              inputFormatters: [
                LengthLimitingTextInputFormatter(19),
                // Limit length to 19 characters (16 digits + 3 spaces)
                CardNumberInputFormatter(),
              ],
            ),
            const SizedBox(height: 80),
            CustomAppButton(
              title: 'Add Card ',
              onPressed: () {
                FirebaseService.addNewCard(
                  CardModel(
                    cardNumber: _cardNumberController.text,
                    cardHolderName: _cardHolderNameController.text,
                    expiryDate: _expiryDateController.text,
                    cardType: "Mastercard",
                    cvv: _cvvController.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateCardInfo(String value) {
    setState(() {}); // Update the UI with new card details
  }
}
