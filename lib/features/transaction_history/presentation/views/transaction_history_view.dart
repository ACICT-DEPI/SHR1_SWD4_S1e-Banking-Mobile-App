import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubits/transaction_cubit/transaction_cubit.dart';
import 'widgets/transaction_history_body.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit()..getAllTransactions(),
      child: const Scaffold(
        body: SafeArea(
          child: TransactionHistoryBody(),
        ),
      ),
    );
  }
}
