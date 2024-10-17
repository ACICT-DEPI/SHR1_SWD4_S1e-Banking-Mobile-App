import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import 'chart_item.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
    required this.categoryModels,
    required this.firstsColor,
    required this.secondsColor,
  });

  final List<CategoryModel> categoryModels;
  final List<Color> firstsColor;
  final List<Color> secondsColor;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChartItem(
              firstColor: firstsColor[0],
              secondColor: secondsColor[0],
              text: categoryModels[0].category,
            ),
            const SizedBox(height: 24),
            ChartItem(
              firstColor: firstsColor[1],
              secondColor: secondsColor[1],
              text: categoryModels[1].category,
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChartItem(
              firstColor: firstsColor[2],
              secondColor: secondsColor[2],
              text: categoryModels[2].category,
            ),
            const SizedBox(height: 24),
            ChartItem(
              firstColor: firstsColor[3],
              secondColor: secondsColor[3],
              text: categoryModels[3].category,
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChartItem(
              firstColor: firstsColor[4],
              secondColor: secondsColor[4],
              text: categoryModels[4].category,
            ),
            const SizedBox(height: 24),
            ChartItem(
              firstColor: firstsColor[5],
              secondColor: secondsColor[5],
              text: categoryModels[5].category,
            ),
          ],
        ),
      ),
    ]);
  }
}
