import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/transaction_item.dart';
import '../../../../../generated/l10n.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';

class TransactionHistoryItems extends StatelessWidget {
  const TransactionHistoryItems({
    super.key,
    required this.listOfTransactionTypes,
    required this.listOfAmounts,
  });

  final List<TransactionType> listOfTransactionTypes;
  final List<double> listOfAmounts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              S.of(context).TransactionHistory,
              style: TextsStyle.textStyleMedium18,
            ),
            Text(
              S.of(context).SeeAll,
              style: TextsStyle.textStyleRegular14.copyWith(
                color: AppColors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18.0),
        Text(
          S.of(context).Today,
          style: TextsStyle.textStyleMedium14.copyWith(
            color: AppColors.greyA7,
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: listOfTransactionTypes.length,
            separatorBuilder: (context, index) => const SizedBox(height: 22),
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
