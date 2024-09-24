import 'package:bank_app/core/network/firebase_service.dart';

class TransactionRepo {
  getAllTransaction() async {
    return FirebaseService.getAllTransactions();
  }
}
