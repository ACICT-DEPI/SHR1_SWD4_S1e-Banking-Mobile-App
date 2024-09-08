import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:bank_app/features/statistics/data/month_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'month_text.dart';

class BalanceChart extends StatefulWidget {
  const BalanceChart({
    super.key,
    required this.lastSixMonthsModel,
    required this.currentBalance,
    required this.maxBalance,
  });

  final List<MonthModel> lastSixMonthsModel;
  final double currentBalance;
  final double maxBalance;

  @override
  State<BalanceChart> createState() => _BalanceChartState();
}

class _BalanceChartState extends State<BalanceChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Current Balance',
            style: TextsStyle.textStyleRegular18.copyWith(color: AppColors.greyA7),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${widget.currentBalance.toStringAsFixed(2)}',
            style: TextsStyle.textStyleMedium26,
          ),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 1.5,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: widget.maxBalance * 1.1,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return MonthText(
                          monthModel: widget.lastSixMonthsModel[value.toInt()],
                          onPressed: () {
                            setState(() {
                              clearAllClicks();
                              widget.lastSixMonthsModel[value.toInt()].isClicked =
                              !widget.lastSixMonthsModel[value.toInt()].isClicked;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  leftTitles: buildAxisTitles(),
                  topTitles: buildAxisTitles(),
                  rightTitles: buildAxisTitles(),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: buildBalanceList(),
                    isCurved: true,
                    color: AppColors.blue,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                    belowBarData: buildBelowBarAreaData(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarAreaData buildBelowBarAreaData() {
    return BarAreaData(
      show: true,
      gradient: LinearGradient(
        colors: [
          AppColors.blue.withOpacity(0.1),
          AppColors.transparent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  void clearAllClicks() {
    for (var monthModel in widget.lastSixMonthsModel) {
      monthModel.isClicked = false;
    }
  }

  List<FlSpot> buildBalanceList() {
    return List.generate(
      widget.lastSixMonthsModel.length,
          (index) => FlSpot(
        index.toDouble(),
        widget.lastSixMonthsModel[index].balance,
      ),
    );
  }

  AxisTitles buildAxisTitles() {
    return const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    );
  }
}
