import 'package:bank_app/features/add_new_card_page/presentation/widgets/card_validator.dart';
import 'package:bank_app/features/navigation_screen/logic/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/Loading_screen.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../../core/widgets/error_screen.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../../../navigation_screen/presentation/home/presentation/views/widgets/bank_card_design.dart';
import '../../domain/cubits/add_card_cubit.dart';
import '../../domain/cubits/add_card_state.dart';
import 'card_input_field.dart';
import 'card_number_Input_formatter.dart';
import 'date_input_formatter.dart';

class AddCardScreenBody extends StatefulWidget {
  const AddCardScreenBody({super.key});

  @override
  State<AddCardScreenBody> createState() => _AddCardScreenBodyState();
}

class _AddCardScreenBodyState extends State<AddCardScreenBody> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return BlocConsumer<AddCardCubit, AddCardState>(
      listener: (context, state) {
        if (state is AddCardSuccessState) {
          BlocProvider.of<HomeScreenCubit>(context).initialize();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is AddCardLoadingState) {
          return const LoadingScreen();
        } else if (state is AddCardFailedState) {
          return ErrorScreen(message: state.message);
        } else {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Cardholder Name Section
                        CardInputField(
                          validator: CardValidator.validateName,
                          keyboardType: TextInputType.name,
                          label: 'Cardholder Name',
                          icon: Icons.person,
                          controller: _cardHolderNameController,
                          onChanged: updateCardInfo,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16)
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: CardInputField(
                                validator: CardValidator.validateExpiryDate,
                                keyboardType: TextInputType.number,
                                label: 'Expiry Date',
                                icon: Icons.calendar_today,
                                controller: _expiryDateController,
                                onChanged: updateCardInfo,
                                inputFormatters: [DateInputFormatter()],
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: CardInputField(
                                validator: CardValidator.validateCvv,
                                keyboardType: TextInputType.number,
                                label: 'CVV',
                                icon: Icons.lock,
                                controller: _cvvController,
                                onChanged: updateCardInfo,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        CardInputField(
                          validator: CardValidator.validateCardNumber,
                          keyboardType: TextInputType.number,
                          label: 'Card Number',
                          icon: Icons.credit_card,
                          controller: _cardNumberController,
                          showCardIcons: true,
                          onChanged: updateCardInfo,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(19),
                            CardNumberInputFormatter()
                          ],
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                  CustomAppButton(
                    title: 'Add Card',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AddCardCubit>(context).addNewCard(
                          CardModel(
                            cardNumber: _cardNumberController.text,
                            cardHolderName: _cardHolderNameController.text,
                            expiryDate: _expiryDateController.text,
                            cardType: "Mastercard",
                            cvv: _cvvController.text,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  void updateCardInfo(String value) {
    setState(() {}); // Update the UI with new card details
  }
}
