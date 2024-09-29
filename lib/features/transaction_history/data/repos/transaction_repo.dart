import '../../../../core/network/firebase_transactions.dart';

class TransactionRepo {
  getAllTransaction() async {
    return FirebaseTransactions.getAllTransactions();
  }
}
