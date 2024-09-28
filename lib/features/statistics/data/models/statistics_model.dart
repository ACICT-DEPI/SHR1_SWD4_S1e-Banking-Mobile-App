class StatisticsModel {
  final List<String> lastSixMonthsDate;
  final List<double> lastSixMonthsBalance;
  final double currentBalance;
  final double maxBalance;
  final double transactionPercent;
  final double musicPercent;
  final double entertainmentPercent;
  final double shoppingPercent;

  StatisticsModel({
    required this.transactionPercent,
    required this.musicPercent,
    required this.entertainmentPercent,
    required this.shoppingPercent,
    required this.lastSixMonthsBalance,
    required this.maxBalance,
    required this.lastSixMonthsDate,
    required this.currentBalance,
  });
}
