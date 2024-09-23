import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../data/models/category_model.dart';

class CircularChart extends StatefulWidget {
  const CircularChart(
      {super.key,
      required this.categoryModels,
      required this.firstsColor,
      required this.secondsColor});

  final List<CategoryModel> categoryModels;
  final List<Color> firstsColor;
  final List<Color> secondsColor;

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: width / 2,
              height: width / 2,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  sectionsSpace: 1.0,
                  centerSpaceRadius: 75.0,
                  sections: showingSections(),
                ),
              ),
            ),
            // Centered text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (touchedIndex == -1)
                      ? ""
                      : "${widget.categoryModels[touchedIndex].percentage.toStringAsFixed(2)}%",
                  style: TextsStyle.textStyleSemiBold26,
                ),
                Text(
                  (touchedIndex == -1)
                      ? ""
                      : widget.categoryModels[touchedIndex].category,
                  style: TextsStyle.textStyleRegular18.copyWith(
                    color: AppColors.greyA7,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 33.0 : 25.0;

      return PieChartSectionData(
        gradient: LinearGradient(
          colors: [widget.secondsColor[i], widget.firstsColor[i]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        value: widget.categoryModels[i].percentage,
        title: widget.categoryModels[i].percentage.toString(),
        radius: radius,
        showTitle: false,
      );
    });
  }
}
