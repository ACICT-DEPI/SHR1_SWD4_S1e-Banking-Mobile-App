import 'package:flutter/material.dart';
import '../../../data/models/category_model.dart';
import 'categories_row.dart';
import 'circular_chart.dart';

class CategoryChartBody extends StatelessWidget {
  const CategoryChartBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> listOfModels = [
      CategoryModel(category: "Transaction", percentage: 40),
      CategoryModel(category: "Entertainment", percentage: 10),
      CategoryModel(category: "Music", percentage: 5),
      CategoryModel(category: "Shopping", percentage: 45),
    ];


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
            categoryModels: listOfModels,
          ),
          const SizedBox(height: 40.0),
          CategoriesRow(
            length: 4,
            secondsColor: CategoryModel.secondsCategoryColor,
            firstsColor: CategoryModel.firstsCategoryColor,
            categoryModels: listOfModels,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
