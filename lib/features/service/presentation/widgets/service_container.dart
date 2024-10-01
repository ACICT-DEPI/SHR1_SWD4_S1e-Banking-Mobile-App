import 'package:flutter/material.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/local/local_settings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer({super.key, required this.service});

  final TransactionType service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(
          color: (LocalSettings.getSettings().themeMode == 'Light')
              ? AppColors.lightGrey
              : AppColors.dark,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Selected Service",
            style: TextsStyle.textStyleRegular12.copyWith(
              color: AppColors.grey94,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Functions.getTransactionTitle(service),
                style: TextsStyle.textStyleMedium16,
              ),
              Icon(Functions.getTransactionIcon(service)),
            ],
          ),
        ],
      ),
    );
  }
}
