import 'package:flutter/material.dart';

import '../../../../../core/widgets/transaction_item.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';

class TransactionItemsColumn extends StatelessWidget {
  const TransactionItemsColumn({super.key});

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
    return Column(
      children: [
        TransactionItem(
          transactionItemModel: TransactionItemModel(
            amount: listOfAmounts[0],
            type: listOfTransactionTypes[0],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TransactionItem(
          transactionItemModel: TransactionItemModel(
            amount: listOfAmounts[1],
            type: listOfTransactionTypes[1],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TransactionItem(
          transactionItemModel: TransactionItemModel(
            amount: listOfAmounts[2],
            type: listOfTransactionTypes[2],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
