import 'package:bloc/bloc.dart';

import '../../../../navigation_screen/data/models/card_model.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';
import '../../../data/repo/send_money_repository.dart';
import 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitialState());

  final SendMoneyRepository _moneyRepository = SendMoneyRepository();

  Future<void> sendMoney(
      {required String id,
      required CardModel card,
      required TransactionItemModel transactionItem}) async {
    emit(ServiceLoadingState());
    try {
      bool result = await _moneyRepository.sendMoney(
        id: id,
        transactionItemModel: transactionItem,
        card: card,
      );
      if (result) {
        emit(ServiceSuccessState());
      } else {
        emit(
          ServiceFailedState(
            message: "Please check the ID or Enter enough amount",
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
