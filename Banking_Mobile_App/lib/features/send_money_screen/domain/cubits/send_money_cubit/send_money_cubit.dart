import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../generated/l10n.dart';
import '../../../../navigation_screen/data/models/card_model.dart';
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

  Future<void> sendMoney({
    required String id,
    required String sender,
    required double amount,
    required CardModel card,
    required BuildContext context,
  }) async {
    emit(SendMoneyLoadingState());
    try {
      bool result = await _moneyRepository.sendMoney(
        id: id,
        amount: amount,
        card: card,
        sender: sender,
        context: context
      );
      if (result) {
        emit(SendMoneySuccessState());
      } else {
        emit(
          SendMoneyFailedState(
            message: S.of(context).CheckIDOrEnterEnoughAmount,
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
