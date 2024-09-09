import 'package:flutter/material.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/transaction_item.dart';
import '../../../data/models/transaction_item_model.dart';

class DayTransaction extends StatelessWidget {
  const DayTransaction({
    super.key,
    required this.listOfTransactionTypes,
    required this.listOfAmounts,
  });

  final List<TransactionType> listOfTransactionTypes;
  final List<double> listOfAmounts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Today",
              style: TextsStyle.textStyleMedium18,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: listOfTransactionTypes.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 22,
            ),
            itemBuilder: (context, index) {
              return TransactionItem(
                transactionItemModel: TransactionItemModel(
                  type: listOfTransactionTypes[index],
                  amount: listOfAmounts[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
