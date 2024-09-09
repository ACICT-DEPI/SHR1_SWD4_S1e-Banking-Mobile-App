class TransactionItemModel {
  final TransactionType type;
  final double amount;

  TransactionItemModel({required this.type, required this.amount});
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
