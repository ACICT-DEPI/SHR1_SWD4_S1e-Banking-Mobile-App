import 'package:bank_app/features/statistics/data/month_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/functions.dart';
import 'balance_chart.dart';
import 'statistics_app_bar.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> lastSixMonthsBalance = [70, 10, 70, 60, 80.6, 50];
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
                  BalanceChart(
                    lastSixMonthsModel: List.generate(
                      6,
                      (index) {
                        return MonthModel(
                          month: lastSixMonthsDate[index],
                          balance: lastSixMonthsBalance[index],
                        );
                      },
                    ),
                    maxBalance: Functions.getMaxBalance(lastSixMonthsBalance),
                    currentBalance: currentBalance,
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
