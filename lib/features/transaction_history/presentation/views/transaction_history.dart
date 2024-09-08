import 'package:flutter/material.dart';

import 'widgets/transaction_history_body.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: TransactionHistoryBody(),
      ),
    );
  }
}
