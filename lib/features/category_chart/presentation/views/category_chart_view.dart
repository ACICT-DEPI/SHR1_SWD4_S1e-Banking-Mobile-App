import 'package:flutter/material.dart';

import 'widgets/category_chart_body.dart';

class CategoryChart extends StatelessWidget {
  const CategoryChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CategoryChartBody()),
    );
  }
}
