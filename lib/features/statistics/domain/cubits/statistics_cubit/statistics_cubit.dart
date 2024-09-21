import 'package:bloc/bloc.dart';

import '../../../../../core/helpers/functions.dart';
import '../../../../../core/network/firebase_service.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';
import '../../../data/models/month_model.dart';
import '../../../data/models/statistics_model.dart';
import '../../../data/repos/statistics_repo.dart';
import 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatisticsInitialState());
  final StatisticsRepo _statisticsRepo = StatisticsRepo();

  initialize() async {
    emit(StatisticsLoadingState());
    try {
      double currentBalance = await _statisticsRepo.getCurrentBalance();

      List<MonthModel> months = await FirebaseService.getAllMonths();
      if (months.isEmpty || months.length < 6) {
        initializeMonths(currentBalance);
      }
      MonthModel lastMonth = months.last;
      String currentMonth = Functions.getCurrentMonth();
      if (lastMonth.month != currentMonth) {
        await FirebaseService.addNewMonth(
          MonthModel(
            index: lastMonth.index + 1,
            month: currentMonth,
            balance: currentBalance,
          ),
        );
      }
      await FirebaseService.updateMonth(MonthModel(
        index: lastMonth.index,
        month: lastMonth.month,
        balance: currentBalance,
      ));
      StatisticsModel statisticsModel =
          await buildStatisticsModel(currentBalance);
      emit(
        StatisticsSuccessState(statisticsModel: statisticsModel),
      );
    } catch (e) {
      // Handle any errors that occur during fetching
      emit(
        StatisticsFailedState(errMessage: e.toString()),
      );
    }
  }

  void initializeMonths(double currentBalance) {
    FirebaseService.addMonths(
      List.generate(
        6,
        (index) => MonthModel(
          month: Functions.getDateLastSixMonths()[index],
          balance: index == 5 ? currentBalance : 0,
          index: index,
        ),
      ),
    );
  }

  Future<StatisticsModel> buildStatisticsModel(double currentBalance) async {
    List<MonthModel> lastSixMonths = await _statisticsRepo.getLastSixMonths();

    List<String> lastSixMonthsDate = List.generate(
      6,
      (index) => lastSixMonths[index].month,
    );

    List<double> lastSixMonthsBalance = List.generate(
      6,
      (index) => lastSixMonths[index].balance,
    );

    double maxBalance = Functions.getMaxBalance(lastSixMonthsBalance);

    List<TransactionItemModel> transactions =
        await _statisticsRepo.getTransactions();
    return StatisticsModel(
      lastSixMonthsDate: lastSixMonthsDate,
      maxBalance: maxBalance,
      lastSixMonthsBalance: lastSixMonthsBalance,
      currentBalance: currentBalance,
      transactions: transactions,
    );
  }
}
