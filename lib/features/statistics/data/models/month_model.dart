class MonthModel {
  final String month;
  final double balance;
  bool isClicked;

  MonthModel(
      {required this.month, required this.balance, this.isClicked = false});

  static List<MonthModel> buildMonthModelList(
      List<String> lastSixMonthsDate, List<double> lastSixMonthsBalance) {
    return List.generate(
      lastSixMonthsDate.length,
      (index) {
        return MonthModel(
          month: lastSixMonthsDate[index],
          balance: lastSixMonthsBalance[index],
        );
      },
    );
  }
}
