import '../../../../core/network/firebase_service.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';

class ServiceRepository {
  Future<bool> sendMoney(
      {required String id,
      required TransactionItemModel transactionItemModel,
      required CardModel card}) async {
    if (card.cardBalance > transactionItemModel.amount) {
      await FirebaseService.addNewTransaction(transactionItemModel);

      return true;
    }
    return false;
  }
}
