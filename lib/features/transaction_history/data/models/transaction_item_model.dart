import 'package:bank_app/core/helpers/functions.dart';

class TransactionItemModel {
  final TransactionType type;
  final double amount;

  TransactionItemModel({required this.type, required this.amount});

  factory TransactionItemModel.fromJson(json) {
    return TransactionItemModel(
        type: Functions.getTransactionType(json["type"]),
        amount: json["amount"]);
  }

  static toJson({required TransactionType type, required double amount}) {
    return {"type": Functions.getTransactionTitle(type), "amount": amount};
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
