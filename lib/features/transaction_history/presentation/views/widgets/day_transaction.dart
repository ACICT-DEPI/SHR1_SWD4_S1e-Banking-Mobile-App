import 'package:flutter/material.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/transaction_item.dart';
import '../../../data/models/transaction_item_model.dart';

class DayTransaction extends StatelessWidget {
  const DayTransaction({
    super.key,
    required this.listOfTransactions,
    required this.day,
  });

  final List<TransactionItemModel> listOfTransactions;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              day,
              style: TextsStyle.textStyleMedium18,
            ),
          ],
        ),
        const SizedBox(height: 12),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listOfTransactions.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 22,
          ),
          itemBuilder: (context, index) {
            return TransactionItem(
              transactionItemModel: TransactionItemModel(
                type: listOfTransactions[index].type,
                amount: listOfTransactions[index].amount,
              ),
            );
          },
        ),
      ],
    );
  }
}
