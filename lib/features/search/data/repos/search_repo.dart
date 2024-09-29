import '../../../../core/helpers/functions.dart';
import '../../../../core/network/firebase_transactions.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';

class SearchRepo {
  searchTransaction(String title) async {
    List<TransactionItemModel> allTransactions =
        await FirebaseTransactions.getAllTransactions();
    return Functions.searchInTransactions(allTransactions, title);
  }
}
