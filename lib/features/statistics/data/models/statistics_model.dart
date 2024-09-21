import '../../../transaction_history/data/models/transaction_item_model.dart';

class StatisticsModel {
  final List<String> lastSixMonthsDate;
  final List<double> lastSixMonthsBalance;
  final double currentBalance;
  final double maxBalance;
  final List<TransactionItemModel> transactions;

  StatisticsModel({
    required this.lastSixMonthsBalance,
    required this.maxBalance,
    required this.transactions,
    required this.lastSixMonthsDate,
    required this.currentBalance,
  });
}
