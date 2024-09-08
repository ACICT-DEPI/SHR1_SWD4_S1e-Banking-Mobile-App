import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({super.key, required this.currentBalance});

  final double currentBalance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Current Balance',
          style: TextsStyle.textStyleRegular18.copyWith(
            color: AppColors.greyA7,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '\$${currentBalance.toStringAsFixed(2)}',
          style: TextsStyle.textStyleMedium26,
        ),
      ],
    );
  }
}
