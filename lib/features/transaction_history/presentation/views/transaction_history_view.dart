import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../core/styles/colors.dart';
import '../../../navigation_screen/logic/home_screen_cubit.dart';
import '../../domain/cubits/transaction_cubit/transaction_cubit.dart';
import 'widgets/transaction_history_body.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final RefreshController _refreshController = RefreshController(initialRefresh: false);

    void _onRefresh() async {

      await Future.delayed(Duration(milliseconds: 1000));
      context.read<HomeScreenCubit>().initialize();
      _refreshController.refreshCompleted();
    }
    return BlocProvider(
      create: (context) => TransactionCubit()..getAllTransactions(),
      child: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        header: const MaterialClassicHeader(
          color: AppColors.blue,
        ),

        controller: _refreshController,
        onRefresh: _onRefresh,
        child: const Scaffold(
          body: SafeArea(
            child: TransactionHistoryBody(),
          ),
        ),
      ),
    );
  }
}
