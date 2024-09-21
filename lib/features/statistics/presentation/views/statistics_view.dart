import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubits/statistics_cubit/statistics_cubit.dart';
import 'widgets/statistics_view_body.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit()..initialize(),
      child: const Scaffold(
        body: SafeArea(
          child: StatisticsViewBody(),
        ),
      ),
    );
  }
}
