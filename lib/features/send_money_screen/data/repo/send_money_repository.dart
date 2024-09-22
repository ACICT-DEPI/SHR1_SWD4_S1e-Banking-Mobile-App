import 'package:bank_app/features/authentication/data/models/user_model.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/network/firebase_service.dart';
import '../../../navigation_screen/data/models/card_model.dart';

class SendMoneyRepository {
  Future<bool> sendMoney(
      {required String id,
      required double amount,
      required CardModel card}) async {
    List<UserModel> allUsers = await FirebaseService.getAllUsers();
    if (card.cardBalance > amount) {
      for (UserModel user in allUsers) {
        if (user.userId == id) {
          Future.wait([
            FirebaseService.sendMoney(amount, card.cardNumber),
            FirebaseService.receiveMoney(id, amount),
          ]);
          return true;
        }
      }
      return false;
    }
    return false;
  }

  Future<double> getCurrentBalance() async {
    return Functions.calculateCurrentBalance(await _getUserCards());
  }

  Future<List<CardModel>> _getUserCards() async {
    return await FirebaseService.getAllCards();
  }
}
