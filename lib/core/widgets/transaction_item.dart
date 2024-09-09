import 'package:bank_app/core/helpers/functions.dart';
import 'package:bank_app/features/transaction_history/data/models/transaction_item_model.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/texts_style.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transactionItemModel,
  });

  final TransactionItemModel transactionItemModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.greyF4,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10),
          child: Functions.getTransactionIcon(transactionItemModel.type),
        ),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Functions.getTransactionTitle(transactionItemModel.type),
              style: TextsStyle.textStyleMedium16,
            ),
            Text(
              Functions.getTransactionSubTitle(transactionItemModel.type),
              style: TextsStyle.textStyleRegular12
                  .copyWith(color: AppColors.greyA7),
            ),
          ],
        ),
        const Spacer(),
        Text(
          getAmountText(),
          style: buildTextStyleMedium16(),
        )
      ],
    );
  }

  TextStyle buildTextStyleMedium16() {
    if (transactionItemModel.amount > 0) {
      return TextsStyle.textStyleMedium16.copyWith(color: AppColors.green47);
    }

    return TextsStyle.textStyleMedium16.copyWith(color: AppColors.red);
  }

  String getAmountText() {
    if (transactionItemModel.amount < 0) {
      return "-\$${transactionItemModel.amount.abs()}";
    }
    return "+\$${transactionItemModel.amount.abs()}";
  }
}
