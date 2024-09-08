import 'package:flutter/material.dart';

import '../../../../../core/widgets/transaction_item.dart';

class TransactionItemsColumn extends StatelessWidget {
  const TransactionItemsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TransactionItem(
          icon: Icons.apple,
          title: "Apple Store",
          subTitle: "Entertainment",
          amount: -200.5,
        ),
        SizedBox(height: 24,),
      ],
    );
  }
}
