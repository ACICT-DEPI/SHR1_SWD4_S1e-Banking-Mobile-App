import '../../../authentication/data/models/user_model.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';
import 'card_model.dart';

class HomeModel {
  UserModel userModel;
  List<TransactionItemModel> transactions;
  List<CardModel> cards;

  HomeModel({
    required this.userModel,
    required this.transactions,
    required this.cards,
  });
}
