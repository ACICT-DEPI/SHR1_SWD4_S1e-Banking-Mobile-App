import 'package:flutter/material.dart';
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
          List<TransactionItemModel> todayTransactions =
              Functions.getToDayTransactions(
            transactions,
          );
          List<TransactionItemModel> lastSevenTransactions =
              Functions.getLastDaysTransactions(
            transactions,
            7,
          );
          List<TransactionItemModel> lastThirtyTransactions =
              Functions.getLastDaysTransactions(
            transactions,
            30,
          );

          return Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TransactionHistoryAppBar(),
                  const SizedBox(height: 30),
                  if (todayTransactions.isNotEmpty) ...[
                    DayTransaction(
                      day: "Today",
                      listOfTransactions: todayTransactions,
                    ),
                    if (lastSevenTransactions.isNotEmpty ||
                        lastThirtyTransactions.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      const Divider(height: 20),
                    ]
                  ],
                  if (lastSevenTransactions.isNotEmpty) ...[
                    DayTransaction(
                      day: "Last 7 days",
                      listOfTransactions: lastSevenTransactions,
                    ),
                    if (lastThirtyTransactions.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      const Divider(height: 20),
                    ]
                  ],
                  if (lastThirtyTransactions.isNotEmpty) ...[
                    DayTransaction(
                      day: "Last 30 days",
                      listOfTransactions: lastThirtyTransactions,
                    )
                  ],
                  const SizedBox(height: 20),
                ],
              ),
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
