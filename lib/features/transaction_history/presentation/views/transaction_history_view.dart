import 'package:flutter/material.dart';

import 'widgets/transaction_history_body.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: TransactionHistoryBody(),
      ),
    );
  }
}
