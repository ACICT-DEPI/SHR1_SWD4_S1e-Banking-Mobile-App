import '../../../../core/helpers/functions.dart';
import '../../../../core/network/firebase_service.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../models/month_model.dart';

class StatisticsRepo {
  Future<List<CardModel>> _getUserCards() async {
    return await FirebaseService.getAllCards();
  }

  Future<double> getCurrentBalance() async {
    return Functions.calculateCurrentBalance(await _getUserCards());
  }

  Future<List<MonthModel>> getLastSixMonths() async {
    List<MonthModel> allMonths = await FirebaseService.getAllMonths();
    return allMonths.sublist(allMonths.length - 6);
  }
}
