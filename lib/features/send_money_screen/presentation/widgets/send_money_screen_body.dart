import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

import '../../../../core/Routing/Routing.dart';
import '../../../../core/network/firebase_authentication.dart';
import '../../../../core/network/firebase_service.dart';
import '../../../../core/widgets/Loading_screen.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../../core/widgets/error_screen.dart';
import '../../../authentication/data/models/user_model.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../../../navigation_screen/presentation/home/presentation/views/widgets/bank_card_design.dart';
import '../../data/models/success_model.dart';
import '../../domain/cubits/get_cards_cubit/get_cards_cubit.dart';
import '../../domain/cubits/get_cards_cubit/get_cards_state.dart';
import '../../domain/cubits/send_money_cubit/send_money_cubit.dart';
import '../../domain/cubits/send_money_cubit/send_money_state.dart';
import 'send_id_textfield.dart';
import 'send_mony_text_field.dart';

class SendMoneyScreenBody extends StatefulWidget {
  const SendMoneyScreenBody({super.key});

  @override
  State<SendMoneyScreenBody> createState() => _SendMoneyScreenBodyState();
}

class _SendMoneyScreenBodyState extends State<SendMoneyScreenBody> {
  int selectedCardIndex = 0;
  TextEditingController amountController = TextEditingController();
  PageController pageController = PageController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMoneyCubit, SendMoneyState>(
      listener: (context, sendMoneyState) async {
        if (sendMoneyState is SendMoneySuccessState) {
          GoRouter.of(context).push(
            Routing.successSendingScreen,
            extra: await buildSuccessModel(),
          );
        }
      },
      builder: (context, sendMoneyState) {
        return BlocBuilder<GetCardsCubit, GetCardsState>(
          builder: (context, getAllCardsState) {
            if (sendMoneyState is SendMoneyLoadingState) {
              return const LoadingScreen();
            } else if (getAllCardsState is GetCardsFailedState) {
              return ErrorScreen(
                message: getAllCardsState.errMessage,
                onPressed: () => GoRouter.of(context).pop(),
              );
            } else if (sendMoneyState is SendMoneyFailedState) {
              return ErrorScreen(
                message: sendMoneyState.message,
                onPressed: () => GoRouter.of(context).pop(),
              );
            } else if (getAllCardsState is GetCardsSuccessState) {
              return Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Form(
                  key: formKey,
                  autovalidateMode: autoValidateMode,
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
                              itemCount: getAllCardsState.cards.length,
                              itemBuilder: (context, index) {
                                final CardModel card =
                                    getAllCardsState.cards[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: BankCardDesign(
                                    card: CardModel(
                                      cvv: card.cvv,
                                      cardNumber: card.cardNumber,
                                      cardHolderName: card.cardHolderName,
                                      expiryDate: card.expiryDate,
                                      cardType: card.cardType,
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
                          SendIdTextField(
                              textController:
                                  context.read<SendMoneyCubit>().idController),
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
                            autoValidateMode = AutovalidateMode.always;
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SendMoneyCubit>(context)
                                  .sendMoney(
                                id: context
                                    .read<SendMoneyCubit>()
                                    .idController
                                    .text,
                                amount: double.parse(amountController.text),
                                card: getAllCardsState.cards[selectedCardIndex],
                                sender: getAllCardsState
                                    .cards[selectedCardIndex].cardHolderName,
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              );
            } else {
              return const LoadingScreen();
            }
          },
        );
      },
    );
  }

  Future<SuccessModel> buildSuccessModel() async {
    UserModel senderUser = await (FirebaseAuthentication.getUserModel());
    UserModel receiverUser = await (FirebaseService.getUser(
        context.read<SendMoneyCubit>().idController.text)) as UserModel;
    return SuccessModel(
      currencyType: 'USD',
      amount: double.parse(amountController.text),
      senderId: senderUser.userId!,
      senderName: senderUser.fullName,
      receiverName: receiverUser.fullName,
      receiverId: receiverUser.userId!,
      receiverPhone: receiverUser.phoneNumber,
      referenceNumber: (1000000 + Random().nextInt(9000000)).toString(),
      date: DateTime.now(),
    );
  }
}
