import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/helpers/functions.dart';
import '../../../../../core/network/firebase_months.dart';
import '../../../../../core/network/firebase_transactions.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';
import '../../../data/models/month_model.dart';
import '../../../data/models/statistics_model.dart';
import '../../../data/repos/statistics_repo.dart';
import 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatisticsInitialState());

  // Instance of StatisticsRepo to interact with statistics-related data.
  final StatisticsRepo _statisticsRepo = StatisticsRepo();

  // This method initializes statistics by fetching necessary data.
  initialize(BuildContext context) async {
    emit(StatisticsLoadingState()); // Emit loading state before starting
    try {
      // Fetch the current balance from the repository
      double currentBalance = await _statisticsRepo.getCurrentBalance();

      // Fetch all months from Firebase
      List<MonthModel> months = await FirebaseMonths.getAllMonths();

      // If no months are present or less than 6 months, initialize them
      if (months.isEmpty || months.length < 6) {
        initializeMonths(currentBalance);
      }

      // Get the most recent month and the current month name
      MonthModel lastMonth = months.last;
      String currentMonth = Functions.getCurrentMonth();

      // If the last month does not match the current month, add the new month
      if (lastMonth.month != currentMonth) {
        await FirebaseMonths.addNewMonth(
          MonthModel(
            index: lastMonth.index + 1, // Increment index for the new month
            month: currentMonth, // Set the current month
            balance: currentBalance, // Set the balance for the new month
          ),
        );
      }

      // If the balance in the last month doesn't match the current balance, update it
      if (lastMonth.balance != currentBalance) {
        await FirebaseMonths.updateMonth(
          MonthModel(
            index: lastMonth.index, // Keep the same index
            month: lastMonth.month, // Same month
            balance: currentBalance, // Updated balance
          ),
        );
      }

      // Build the statistics model after updating or adding months
      StatisticsModel statisticsModel = await buildStatisticsModel(context);

      // Emit success state with the fetched statistics model
      emit(
        StatisticsSuccessState(statisticsModel: statisticsModel),
      );
    } catch (e) {
      // Handle any errors that occur during the fetching process
      emit(
        StatisticsFailedState(errMessage: e.toString()),
      );
    }
  }

  // Method to initialize the last 6 months with current balance
  void initializeMonths(double currentBalance) {
    FirebaseMonths.addMonths(
      List.generate(
        6, // Generate 6 months
        (index) => MonthModel(
          month: Functions.getDateLastSixMonths()[index],
          // Get last six months dates
          balance: index == 5 ? currentBalance : 0,
          // Set balance only for the last month
          index: index, // Set the index of the month
        ),
      ),
    );
  }

  // Method to build the statistics model with data
  Future<StatisticsModel> buildStatisticsModel(BuildContext context) async {
    // Fetch the current balance
    double currentBalance = await _statisticsRepo.getCurrentBalance();

    // Fetch the last six months from the repository
    List<MonthModel> lastSixMonths = await _statisticsRepo.getLastSixMonths();

    // Extract the month names for the last six months
    List<String> lastSixMonthsDate = List.generate(
      6,
      (index) => lastSixMonths[index].month,
    );

    // Extract the balances for the last six months
    List<double> lastSixMonthsBalance = List.generate(
      6,
      (index) => lastSixMonths[index].balance,
    );

    // Get the maximum balance from the last six months
    double maxBalance = Functions.getMaxBalance(lastSixMonthsBalance);

    List<TransactionItemModel> allTransactions =
        await FirebaseTransactions.getAllTransactions();

    double financialServicesPercent =
        Functions.getTransactionPercent('Financial Services', allTransactions,context);

    double utilitiesPercent =
        Functions.getTransactionPercent('Utilities', allTransactions,context);

    double entertainmentPercent =
        Functions.getTransactionPercent('Entertainment', allTransactions,context);

    double shoppingPercent =
        Functions.getTransactionPercent('Shopping', allTransactions,context);

    double telecommunicationPercent =
        Functions.getTransactionPercent('Telecommunication', allTransactions,context);

    double transportPercent =
        Functions.getTransactionPercent('Transport', allTransactions,context);

    // Return the statistics model with all the fetched data
    return StatisticsModel(
      lastSixMonthsDate: lastSixMonthsDate,
      // Dates of the last six months
      maxBalance: maxBalance,
      // Maximum balance in the last six months
      lastSixMonthsBalance: lastSixMonthsBalance,
      // List of balances
      currentBalance: currentBalance,
      financialServicesPercent: financialServicesPercent,
      utilitiesPercent: utilitiesPercent,
      entertainmentPercent: entertainmentPercent,
      shoppingPercent: shoppingPercent,
      telecommunicationPercent: telecommunicationPercent,
      transportPercent: transportPercent,
    );
  }
}
