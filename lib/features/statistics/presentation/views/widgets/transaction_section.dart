import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';
import '../../../../transaction_history/presentation/views/transaction_history_view.dart';
import 'transaction_items_column.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({
    super.key,
    required this.transactions,
  });

  final List<TransactionItemModel> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Transaction",
              style: TextsStyle.textStyleMedium18,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionHistoryView(),
                  ),
                );
              },
              child: Text(
                "See All",
                style: TextsStyle.textStyleMedium14
                    .copyWith(color: AppColors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        TransactionItemsColumn(
          transactions: transactions,
        ),
      ],
    );
  }
}
