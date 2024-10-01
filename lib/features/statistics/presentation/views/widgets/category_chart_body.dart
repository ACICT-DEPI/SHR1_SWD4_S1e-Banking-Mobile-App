import 'package:flutter/material.dart';
import '../../../data/models/category_model.dart';
import 'categories_row.dart';
import 'circular_chart.dart';

class CategoryChartBody extends StatelessWidget {
  const CategoryChartBody({super.key, required this.listOfCategoryModel});

  final List<CategoryModel> listOfCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CircularChart(
          firstsColor: CategoryModel.firstsCategoryColor,
          secondsColor: CategoryModel.secondsCategoryColor,
          categoryModels: listOfCategoryModel,
        ),
        const SizedBox(height: 40.0),
        CategoriesRow(
          secondsColor: CategoryModel.secondsCategoryColor,
          firstsColor: CategoryModel.firstsCategoryColor,
          categoryModels: listOfCategoryModel,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
