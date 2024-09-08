class MonthModel {
  final String month;
  final double balance;
  bool isClicked;

  MonthModel(
      {required this.month, required this.balance, this.isClicked = false});
}
