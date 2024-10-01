class StatisticsModel {
  final List<String> lastSixMonthsDate;
  final List<double> lastSixMonthsBalance;
  final double currentBalance;
  final double maxBalance;
  final double financialServicesPercent;
  final double utilitiesPercent;
  final double entertainmentPercent;
  final double shoppingPercent;
  final double telecommunicationPercent;
  final double transportPercent;

  StatisticsModel({
    required this.financialServicesPercent,
    required this.telecommunicationPercent,
    required this.transportPercent,
    required this.utilitiesPercent,
    required this.entertainmentPercent,
    required this.shoppingPercent,
    required this.lastSixMonthsBalance,
    required this.maxBalance,
    required this.lastSixMonthsDate,
    required this.currentBalance,
  });
}
