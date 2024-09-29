import '../../../../core/helpers/functions.dart';
import '../../../../core/network/firebase_cards.dart';
import '../../../../core/network/firebase_months.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../models/month_model.dart';

class StatisticsRepo {
  Future<List<CardModel>> _getUserCards() async {
    return await FirebaseCards.getAllCards();
  }

  Future<double> getCurrentBalance() async {
    return Functions.calculateCurrentBalance(await _getUserCards());
  }

  Future<List<MonthModel>> getLastSixMonths() async {
    List<MonthModel> allMonths = await FirebaseMonths.getAllMonths();
    return allMonths.sublist(allMonths.length - 6);
  }
}
