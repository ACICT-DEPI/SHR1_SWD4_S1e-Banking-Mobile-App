import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/texts_style.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.amount,
  });

  final IconData icon;
  final String title;
  final String subTitle;
  final double amount;

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
          child: Icon(icon),
        ),
        const SizedBox(width: 20.0),
        Column(
          children: [
            Text(
              title,
              style: TextsStyle.textStyleMedium16,
            ),
            Text(
              subTitle,
              style: TextsStyle.textStyleRegular12
                  .copyWith(color: AppColors.greyA7),
            ),
          ],
        ),
        Spacer(),
        Text(
          getAmountText(),
          style: TextsStyle.textStyleMedium16,
        )
      ],
    );
  }

  String getAmountText() {
    if (amount < 0) {
      return "-\$${amount.abs()}";
    }else{
      return "\$${amount.abs()}";
    }
  }
}
