import 'package:bank_app/core/widgets/Loading_screen.dart';
import 'package:bank_app/core/widgets/error_screen.dart';
import 'package:bank_app/features/transaction_history/domain/cubits/transaction_cubit/transaction_cubit.dart';
import 'package:bank_app/features/transaction_history/domain/cubits/transaction_cubit/transaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/transaction_item_model.dart';
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
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: TransactionHistoryAppBar()),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
                SliverFillRemaining(
                  child: DayTransaction(
                    listOfTransactionTypes: List.generate(
                      transactions.length,
                      (index) => transactions[index].type,
                    ),
                    listOfAmounts: List.generate(
                      transactions.length,
                      (index) => transactions[index].amount,
                    ),
                  ),
                ),
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
