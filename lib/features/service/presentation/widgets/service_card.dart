import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/Routing/Routing.dart';
import '../../../../core/helpers/functions.dart';
import '../../../../core/styles/colors.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';

class ServiceCard extends StatelessWidget {
  final TransactionType service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routing.serviceView, extra: service);
      },
      child: Card(
        shadowColor: AppColors.greyA7,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.lightGrey, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Functions.getTransactionIcon(service), size: 40.0,
              color: Colors.blue, // Customize icon color
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 100,
              child: AutoSizeText(
                Functions.getTransactionTitle(service),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
