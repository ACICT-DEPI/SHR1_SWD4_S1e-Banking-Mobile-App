import '../../../../core/network/firebase_authentication.dart';
import '../../../../core/network/firebase_cards.dart';
import '../../../../core/network/firebase_transactions.dart';
import '../../../authentication/data/models/user_model.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';
import '../models/card_model.dart';

class HomeScreenRepository {
  Future<List<CardModel>> getUserCards() async {
    return await FirebaseCards.getAllCards();
  }

  Future<UserModel> getUserModel() async {
    return await FirebaseAuthentication.getUserModel();
  }

  Future<List<TransactionItemModel>> getTransactions() async {
    return await FirebaseTransactions.getAllTransactions();
  }
}
