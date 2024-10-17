import 'package:bank_app/features/statistics/data/models/month_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class MonthText extends StatelessWidget {
  const MonthText({
    super.key,
    required this.monthModel,
    this.onPressed,
  });

  final MonthModel monthModel;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          backgroundColor: (monthModel.isClicked)
              ? const WidgetStatePropertyAll(AppColors.blue)
              : null),
      onPressed: onPressed,
      child: Text(
        monthModel.month,
        style: (monthModel.isClicked)
            ? TextsStyle.textStyleRegular15.copyWith(color: AppColors.white)
            : TextsStyle.textStyleRegular15,
      ),
    );
  }
}
