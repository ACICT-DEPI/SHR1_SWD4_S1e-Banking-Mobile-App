import 'package:bank_app/core/helpers/functions.dart';

class TransactionItemModel {
  final TransactionType type;
  final double amount;
  final DateTime createdAt;

  TransactionItemModel({
    DateTime? createdAt,
    required this.type,
    required this.amount,
  }) : createdAt = createdAt ?? DateTime.now();

  factory TransactionItemModel.fromJson(json) {
    return TransactionItemModel(
      type: Functions.getTransactionType(json["type"]),
      amount: json["amount"],
      createdAt: json["createdAt"].toDate(),
    );
  }

  static toJson({required TransactionItemModel transactionModel}) {
    return {
      "type": Functions.getTransactionTitle(transactionModel.type),
      "amount": transactionModel.amount,
      "createdAt": transactionModel.createdAt,
    };
  }
}

enum TransactionType {
  spotify,
  appleStore,
  moneyTransfer,
  grocery,
  googlePlay,
  amazonPay,
  paypal,
  netflix,         // New Transaction Type
  uber,            // New Transaction Type
  waterBill,       // New Transaction Type
  homeInternet,    // New Transaction Type
  mobileBill,      // New Transaction Type
  mobileRecharge,  // New Transaction Type
  socialInsurance,  // New Transaction Type
  fawryPay,       // New Transaction Type
  landline,        // New Transaction Type
  electricity,     // New Transaction Type
  financeAndBanks, // New Transaction Type
  donations,       // New Transaction Type
  games,           // New Transaction Type
  gas,             // New Transaction Type
  tickets,         // New Transaction Type
  microfinance,    // New Transaction Type
  education,       // New Transaction Type
  saveGaza,        // New Transaction Type
  dailyWaste,      // New Transaction Type
  payments,        // New Transaction Type
  unions, shopping           // New Transaction Type
}


