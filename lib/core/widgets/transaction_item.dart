import 'package:bank_app/core/local/local_settings.dart';
import 'package:flutter/material.dart';

import '../../features/transaction_history/data/models/transaction_item_model.dart';
import '../helpers/functions.dart';
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
          decoration: BoxDecoration(
            color: (LocalSettings.getSettings().themeMode == 'Light')
                ? AppColors.greyF4
                : AppColors.dark,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(Functions.getTransactionIcon(transactionItemModel.type)),
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
