import 'package:bank_app/features/authentication/data/models/user_model.dart';

import '../../../../core/network/firebase.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';
import '../models/card_model.dart';

class HomeScreenRepository {

  final List<TransactionItemModel> transactions = [
    TransactionItemModel(
      type: TransactionType.spotify,
      amount: -70.58,
    )
  ];

  final List<CardModel> cards = [
    CardModel(
      cardNumber: '1234 5678 9012 3456',
      cardHolderName: 'ahmed salah',
      expiryDate: '12/24',
      cardType: 'visa',
      cvv: '455',
    ),
    CardModel(
      cardNumber: '5678 1234 9012 3456',
      cardHolderName: 'Jane Smith',
      expiryDate: '01/25',
      cardType: 'mastercard',
      cvv: '123',
    ),
    // Add more CardModel instances as needed
  ];

  List<CardModel> getUserCards() {
    return cards;
  }

  Future<UserModel> getUserModel()  {
    return  FirebaseService.getUserModel();
  }

  List<TransactionItemModel> getTransactions() {
    return transactions;
  }
}
