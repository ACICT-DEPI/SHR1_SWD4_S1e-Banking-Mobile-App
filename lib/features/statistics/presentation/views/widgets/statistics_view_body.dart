import 'package:bank_app/core/widgets/Loading_screen.dart';
import 'package:bank_app/core/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/models/month_model.dart';
import '../../../domain/cubits/statistics_cubit/statistics_cubit.dart';
import '../../../domain/cubits/statistics_cubit/statistics_state.dart';
import 'balance_chart.dart';
import 'current_balance.dart';
import 'transaction_section.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder: (context, state) {
        if (state is StatisticsLoadingState) {
          return const LoadingScreen();
        } else if (state is StatisticsSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              children: [
                CustomAppBar(
                  appBarTitle: "Statistics",
                  rightIcon: Icons.notifications_none,
                  onPressedRight: () {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        CurrentBalance(
                            currentBalance:
                                state.statisticsModel.currentBalance),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: BalanceChart(
                              lastSixMonthsModel:
                                  MonthModel.fromJsonBuildMonthModelList(
                                {
                                  "lastSixMonthsDate":
                                      state.statisticsModel.lastSixMonthsDate,
                                  "lastSixMonthsBalance": state
                                      .statisticsModel.lastSixMonthsBalance,
                                },
                              ),
                              maxBalance: state.statisticsModel.maxBalance),
                        ),
                        const SizedBox(height: 30),
                        const TransactionSection()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is StatisticsFailedState) {
          return ErrorScreen(message: state.errMessage);
        } else {
          return const ErrorScreen(message: "error");
        }
      },
    );
  }
}
