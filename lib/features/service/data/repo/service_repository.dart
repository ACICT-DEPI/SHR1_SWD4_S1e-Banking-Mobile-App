import 'package:flutter/cupertino.dart';

import '../../../../core/network/firebase_transactions.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';

class ServiceRepository {
  Future<bool> sendMoney({
    required String id,
    required TransactionItemModel transactionItemModel,
    required CardModel card,
    required BuildContext context,
  }) async {
    if (card.cardBalance > transactionItemModel.amount.abs()) {
      await FirebaseTransactions.addNewTransaction(
          transactionItemModel, card.cardNumber, context);

      return true;
    }
    return false;
  }
}
