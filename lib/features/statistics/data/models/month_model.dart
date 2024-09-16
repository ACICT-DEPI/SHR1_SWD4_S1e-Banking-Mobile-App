class MonthModel {
  final String month;
  final double balance;
  bool isClicked;

  MonthModel(
      {required this.month, required this.balance, this.isClicked = false});

  static List<MonthModel> fromJsonBuildMonthModelList(json) {
    return List.generate(
      6,
      (index) {
        return MonthModel(
          month: json["lastSixMonthsDate"][index],
          balance: json["lastSixMonthsBalance"][index],
        );
      },
    );
  }

  static Map toJsonBuildList(
      List<String> lastSixMonthsDate, List<double> lastSixMonthsBalance) {
    return {
      "lastSixMonthsDate": List.generate(
        6,
        (index) {
          return {
            "month": lastSixMonthsDate[index],
          };
        },
      ),
      "lastSixMonthsBalance": List.generate(
        6,
        (index) {
          return {"balance": lastSixMonthsBalance[index]};
        },
      ),
    };
  }
}
