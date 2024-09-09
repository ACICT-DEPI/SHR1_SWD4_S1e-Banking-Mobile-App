import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class CategoryModel {
  final String category;
  final double percentage;

  CategoryModel({required this.category, required this.percentage});

  static final List<Color> firstsCategoryColor = [
    AppColors.yellow,
    AppColors.pink,
    AppColors.greenC2,
    AppColors.purple
  ];
  static final List<Color> secondsCategoryColor = [
    AppColors.orange,
    AppColors.purple,
    AppColors.greenC8,
    AppColors.lightBlue
  ];
}
