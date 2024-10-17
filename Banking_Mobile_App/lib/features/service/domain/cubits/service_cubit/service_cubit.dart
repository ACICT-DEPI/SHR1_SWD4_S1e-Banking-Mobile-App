import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../generated/l10n.dart';
import '../../../../navigation_screen/data/models/card_model.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';
import '../../../data/repo/service_repository.dart';
import 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitialState());

  final ServiceRepository _moneyRepository = ServiceRepository();

  Future<void> sendMoney({
    required String id,
    required CardModel card,
    required TransactionItemModel transactionItem,
    required BuildContext context,
  }) async {
    emit(ServiceLoadingState());
    try {
      bool result = await _moneyRepository.sendMoney(
        id: id,
        transactionItemModel: transactionItem,
        card: card,
        context: context
      );
      if (result) {
        emit(ServiceSuccessState());
      } else {
        emit(
          ServiceFailedState(
            message: S.of(context).CheckIDOrEnterEnoughAmount,
          ),
        );
      }
    } catch (e) {
      emit(
        ServiceFailedState(message: e.toString()),
      );
    }
  }
}
