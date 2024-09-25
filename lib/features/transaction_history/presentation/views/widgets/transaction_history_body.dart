import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/functions.dart';
import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/error_screen.dart';
import '../../../data/models/transaction_item_model.dart';
import '../../../domain/cubits/transaction_cubit/transaction_cubit.dart';
import '../../../domain/cubits/transaction_cubit/transaction_state.dart';
import 'day_transaction.dart';
import 'transaction_history_app_bar.dart';

class TransactionHistoryBody extends StatelessWidget {
  const TransactionHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionSuccessState) {
          List<TransactionItemModel> transactions = state.transactionModels;
          return Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: TransactionHistoryAppBar()),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
                SliverFillRemaining(
                  child: DayTransaction(
                    day: "Today",
                    listOfTransactions: Functions.getToDayTransactions(
                      transactions,
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: DayTransaction(
                    day: "Last 7 days",
                    listOfTransactions: Functions.getLastDaysTransactions(
                      transactions,
                      7,
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: DayTransaction(
                    day: "Last 30 days",
                    listOfTransactions: Functions.getLastDaysTransactions(
                      transactions,
                      30,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
          );
        } else if (state is TransactionFailedState) {
          return ErrorScreen(message: state.errMessage);
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
