import 'package:flutter/material.dart';
import '../../../data/models/category_model.dart';
import 'categories_row.dart';
import 'circular_chart.dart';

class CategoryChartBody extends StatelessWidget {
  const CategoryChartBody({super.key, required this.listOfCategoryModel});

  final List<CategoryModel> listOfCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
      child: Column(
        children: [
          CircularChart(
            firstsColor: CategoryModel.firstsCategoryColor,
            secondsColor: CategoryModel.secondsCategoryColor,
            categoryModels: listOfCategoryModel,
          ),
          const SizedBox(height: 40.0),
          CategoriesRow(
            length: 4,
            secondsColor: CategoryModel.secondsCategoryColor,
            firstsColor: CategoryModel.firstsCategoryColor,
            categoryModels: listOfCategoryModel,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
