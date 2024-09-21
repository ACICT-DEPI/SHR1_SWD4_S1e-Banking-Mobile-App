import 'package:bank_app/core/helpers/functions.dart';

class TransactionItemModel {
  final TransactionType type;
  final double amount;
  final DateTime _createdAt;

  TransactionItemModel({
    DateTime? createdAt,
    required this.type,
    required this.amount,
  }) : _createdAt = createdAt ?? DateTime.now();

  factory TransactionItemModel.fromJson(json) {
    return TransactionItemModel(
      type: Functions.getTransactionType(json["type"]),
      amount: json["amount"],
      createdAt: json["createdAt"],
    );
  }

  static toJson({required TransactionItemModel transactionModel}) {
    return {
      "type": Functions.getTransactionTitle(transactionModel.type),
      "amount": transactionModel.amount,
      "createdAt": transactionModel._createdAt,
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
  paypal
}
