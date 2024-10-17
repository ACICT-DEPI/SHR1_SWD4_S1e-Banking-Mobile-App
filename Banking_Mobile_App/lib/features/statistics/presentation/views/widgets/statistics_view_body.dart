import 'package:bank_app/core/Routing/Routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/error_screen.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/statistics_model.dart';
import 'category_chart_body.dart';
import '../../../data/models/month_model.dart';
import '../../../domain/cubits/statistics_cubit/statistics_cubit.dart';
import '../../../domain/cubits/statistics_cubit/statistics_state.dart';
import 'balance_chart.dart';
import 'current_balance.dart';

class StatisticsViewBody extends StatefulWidget {
  const StatisticsViewBody({super.key});

  @override
  State<StatisticsViewBody> createState() => _StatisticsViewBodyState();
}

class _StatisticsViewBodyState extends State<StatisticsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StatisticsCubit>(context).initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder: (context, state) {
        if (state is StatisticsLoadingState) {
          return const LoadingScreen();
        } else if (state is StatisticsSuccessState) {
          StatisticsModel statisticsModel = state.statisticsModel;
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              children: [
                CustomAppBar(
                  appBarTitle: S.of(context).Statistics,
                  rightIcon: Icons.notifications_none,
                  onPressedRight: () {
                    context.push(Routing.notificationsScreen);
                  },
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(height: 30),
                      CurrentBalance(
                        currentBalance: state.statisticsModel.currentBalance,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: BalanceChart(
                          lastSixMonthsModel:
                              MonthModel.fromJsonBuildMonthModelList(
                            {
                              "lastSixMonthsDate":
                                  statisticsModel.lastSixMonthsDate,
                              "lastSixMonthsBalance":
                                  statisticsModel.lastSixMonthsBalance,
                            },
                          ),
                          maxBalance: statisticsModel.maxBalance,
                        ),
                      ),
                      if (showCategoryChart(statisticsModel)) ...[
                        const Divider(height: 40),
                        Text(
                          S.of(context).CategoryChart,
                          style: TextsStyle.textStyleMedium22,
                        ),
                        CategoryChartBody(
                          listOfCategoryModel: [
                            CategoryModel(
                              category: S.of(context).FinancialServices,
                              percentage:
                                  statisticsModel.financialServicesPercent,
                            ),
                            CategoryModel(
                              category: S.of(context).Entertainment,
                              percentage: statisticsModel.entertainmentPercent,
                            ),
                            CategoryModel(
                              category: S.of(context).Utilities,
                              percentage: statisticsModel.utilitiesPercent,
                            ),
                            CategoryModel(
                              category: S.of(context).Shopping,
                              percentage: statisticsModel.shoppingPercent,
                            ),
                            CategoryModel(
                              category: S.of(context).Telecommunication,
                              percentage:
                                  statisticsModel.telecommunicationPercent,
                            ),
                            CategoryModel(
                              category: S.of(context).Transport,
                              percentage: statisticsModel.transportPercent,
                            ),
                          ],
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is StatisticsFailedState) {
          return ErrorScreen(
            message: state.errMessage,
            onPressed: () {
              BlocProvider.of<StatisticsCubit>(context).initialize(context);
            },
          );
        } else {
          return ErrorScreen(message: S.of(context).Error);
        }
      },
    );
  }

  bool showCategoryChart(StatisticsModel statisticsModel) {
    return !(statisticsModel.financialServicesPercent +
            statisticsModel.entertainmentPercent +
            statisticsModel.utilitiesPercent +
            statisticsModel.shoppingPercent +
            statisticsModel.telecommunicationPercent +
            statisticsModel.transportPercent)
        .isNaN;
  }
}
