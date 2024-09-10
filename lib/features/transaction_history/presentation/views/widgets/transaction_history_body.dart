import 'package:flutter/material.dart';

import '../../../data/models/transaction_item_model.dart';
import 'day_transaction.dart';
import 'transaction_history_app_bar.dart';

class TransactionHistoryBody extends StatelessWidget {
  const TransactionHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TransactionType> listOfTransactionTypes = [
      TransactionType.paypal,
      TransactionType.amazonPay,
      TransactionType.googlePlay,
      TransactionType.grocery,
      TransactionType.spotify,
      TransactionType.moneyTransfer,
      TransactionType.appleStore
    ];
    final List<double> listOfAmounts = [
      -70.58,
      10.58,
      580.2,
      -585.50,
      70,
      70.58,
      -70
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: TransactionHistoryAppBar()),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverFillRemaining(
            child: DayTransaction(
              listOfTransactionTypes: listOfTransactionTypes,
              listOfAmounts: listOfAmounts,
            ),
          ),
        ],
      ),
    );
  }
}
