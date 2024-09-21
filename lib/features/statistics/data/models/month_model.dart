class MonthModel {
  final String month;
  final double balance;
  final int index;
  bool isClicked;

  MonthModel(
      {required this.index,
      required this.month,
      required this.balance,
      this.isClicked = false});

  factory MonthModel.fromJson(json) {
    return MonthModel(
      month: json['month'],
      balance: json['balance'],
      index: json['index'],
    );
  }

  static toJson(MonthModel monthModel) {
    return {
      'month': monthModel.month,
      'balance': monthModel.balance,
      'index': monthModel.index
    };
  }

  static List<MonthModel> fromJsonBuildMonthModelList(json) {
    return List.generate(
      6,
      (index) {
        return MonthModel(
          month: json["lastSixMonthsDate"][index],
          balance: json["lastSixMonthsBalance"][index],
          index: index,
        );
      },
    );
  }
//
// static Map toJsonBuildList(
//     List<String> lastSixMonthsDate, List<double> lastSixMonthsBalance) {
//   return {
//     "lastSixMonthsDate": List.generate(
//       6,
//       (index) {
//         return {
//           "month": lastSixMonthsDate[index],
//         };
//       },
//     ),
//     "lastSixMonthsBalance": List.generate(
//       6,
//       (index) {
//         return {"balance": lastSixMonthsBalance[index]};
//       },
//     ),
//   };
// }
}
