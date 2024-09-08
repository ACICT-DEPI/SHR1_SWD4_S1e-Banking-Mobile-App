import 'package:flutter/material.dart';

import 'widgets/statistics_view_body.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: StatisticsViewBody(),
      ),
    );
  }
}
