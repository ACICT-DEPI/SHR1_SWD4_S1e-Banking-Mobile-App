import 'package:flutter/material.dart';

import '../../../../../core/widgets/transaction_item.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';

class TransactionItemsColumn extends StatelessWidget {
  const TransactionItemsColumn({super.key, required this.transactions});

  final List<TransactionItemModel> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.length > 4 ? 4 : transactions.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        return TransactionItem(
          transactionItemModel: TransactionItemModel(
            amount: transactions[index].amount,
            type: transactions[index].type,
          ),
        );
      },
    );
  }
}
