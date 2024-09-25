class StatisticsModel {
  final List<String> lastSixMonthsDate;
  final List<double> lastSixMonthsBalance;
  final double currentBalance;
  final double maxBalance;

  StatisticsModel({
    required this.lastSixMonthsBalance,
    required this.maxBalance,
    required this.lastSixMonthsDate,
    required this.currentBalance,
  });
}
