import 'package:bank_app/core/network/firebase_authentication.dart';
import 'package:bank_app/features/authentication/data/models/user_model.dart';
import 'package:bank_app/features/transaction_history/data/models/transaction_item_model.dart';

import '../../../../core/network/firebase_service.dart';
import '../../../navigation_screen/data/models/card_model.dart';

class SendMoneyRepository {
  Future<bool> sendMoney(
      {required String id,
      required String sender,
      required double amount,
      required CardModel card}) async {
    List<UserModel> allUsers = await FirebaseService.getAllUsers();
    if (card.cardBalance > amount) {
      for (UserModel user in allUsers) {
        if (user.userId == id &&
            user.userId != FirebaseAuthentication.getUserId()) {
          Future.wait([
            FirebaseService.addNewTransaction(
              TransactionItemModel(
                type: TransactionType.moneyTransfer,
                amount: -amount,
              ),
              card.cardNumber,
            ),
            FirebaseService.receiveMoney(id, amount, sender),
          ]);
          return true;
        }
      }
      return false;
    }
    return false;
  }
}
