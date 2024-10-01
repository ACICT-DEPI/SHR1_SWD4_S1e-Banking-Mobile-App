import 'package:flutter/cupertino.dart';

import '../../../../core/network/firebase_authentication.dart';
import '../../../../core/network/firebase_service.dart';
import '../../../../core/network/firebase_transactions.dart';
import '../../../authentication/data/models/user_model.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';

class SendMoneyRepository {
  Future<bool> sendMoney({
    required String id,
    required String sender,
    required double amount,
    required CardModel card,
    required BuildContext context,
  }) async {
    List<UserModel> allUsers = await FirebaseService.getAllUsers();
    if (card.cardBalance > amount) {
      for (UserModel user in allUsers) {
        if (user.userId == id &&
            user.userId != FirebaseAuthentication.getUserId()) {
          Future.wait([
            FirebaseTransactions.addNewTransaction(
                TransactionItemModel(
                  type: TransactionType.moneyTransfer,
                  amount: -amount,
                ),
                card.cardNumber,
                context),
            FirebaseTransactions.receiveMoney(id, amount, sender,context),
          ]);
          return true;
        }
      }
      return false;
    }
    return false;
  }
}
