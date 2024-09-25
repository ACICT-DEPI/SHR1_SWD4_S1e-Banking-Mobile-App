import 'package:bank_app/features/navigation_screen/data/models/card_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/repo/send_money_repository.dart';
import 'send_money_state.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  SendMoneyCubit() : super(SendMoneyInitialState());
  TextEditingController idController = TextEditingController();

  updateId(String id) {
    idController.text = id;
    emit(SendMoneyInitialState());
  }
  final SendMoneyRepository _moneyRepository = SendMoneyRepository();

  Future<void> sendMoney(
      {required String id,
      required double amount,
      required CardModel card}) async {
    emit(SendMoneyLoadingState());
    try {
      bool result = await _moneyRepository.sendMoney(
        id: id,
        amount: amount,
        card: card,
      );
      if (result) {
        emit(SendMoneySuccessState());
      } else {
        emit(
          SendMoneyFailedState(
            message: "Please check the ID or Enter enough amount",
          ),
        );
      }
    } catch (e) {
      emit(
        SendMoneyFailedState(message: e.toString()),
      );
    }
  }
}
