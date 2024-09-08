import 'package:flutter/material.dart';

import '../../../../../core/helpers/functions.dart';
import '../../../data/month_model.dart';
import 'balance_chart.dart';
import 'current_balance.dart';
import 'statistics_app_bar.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> lastSixMonthsBalance = [404, 1001, 700, 700, 110.6, 140];
    final List<String> lastSixMonthsDate = Functions.getLastSixMonths();
    const double currentBalance = 45045.58;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: StatisticsAppBar(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const CurrentBalance(currentBalance: currentBalance),
                  const SizedBox(height: 20),
                  BalanceChart(
                    lastSixMonthsModel: MonthModel.buildMonthModelList(
                      lastSixMonthsDate,
                      lastSixMonthsBalance,
                    ),
                    maxBalance: Functions.getMaxBalance(lastSixMonthsBalance),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
