import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../data/models/month_model.dart';
import 'month_text.dart';

class BalanceChart extends StatefulWidget {
  const BalanceChart({
    super.key,
    required this.lastSixMonthsModel,
    required this.maxBalance,
  });

  final List<MonthModel> lastSixMonthsModel;
  final double maxBalance;

  @override
  State<BalanceChart> createState() => _BalanceChartState();
}

class _BalanceChartState extends State<BalanceChart> {
  int? selectedMonthIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
                        selectedMonthIndex = value.toInt();
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
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  if (index == selectedMonthIndex) {
                    return FlDotCirclePainter(
                      radius: 5,
                      color: Colors.white,
                      strokeWidth: 5,
                      strokeColor: Colors.blue,
                    );
                  } else {
                    return FlDotCirclePainter(radius: 0, strokeWidth: 0);
                  }
                },
              ),
              belowBarData: buildBelowBarAreaData(),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipMargin: 8,
              getTooltipColor: (touchedSpot) => AppColors.blue.withOpacity(.6),
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((touchedSpot) {
                  final balance = touchedSpot.y;
                  return LineTooltipItem(
                    '\$${balance.toStringAsFixed(2)}',
                    TextsStyle.textStyleSemiBold16
                        .copyWith(color: AppColors.white),
                  );
                }).toList();
              },
            ),
            touchCallback:
                (FlTouchEvent event, LineTouchResponse? touchResponse) {
              if (touchResponse != null && touchResponse.lineBarSpots != null) {
                setState(() {
                  int touchedIndex =
                      touchResponse.lineBarSpots!.first.x.toInt();

                  clearAllClicks();

                  selectedMonthIndex =
                      touchResponse.lineBarSpots!.first.x.toInt();

                  widget.lastSixMonthsModel[touchedIndex].isClicked = true;
                });
              }
            },
          ),
        ),
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
