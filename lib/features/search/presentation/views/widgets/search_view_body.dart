import 'package:flutter/material.dart';

import '../../../../../core/widgets/transaction_item.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';
import 'search_app_bar.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TransactionType> listOfTransactionTypes = [
      TransactionType.paypal,
      TransactionType.amazonPay,
      TransactionType.googlePlay,
      TransactionType.grocery,
      TransactionType.spotify,
      TransactionType.moneyTransfer,
      TransactionType.appleStore
    ];

    final List<double> listOfAmounts = [
      -70.58,
      10.58,
      580.2,
      -585.50,
      70,
      70.58,
      -70
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Column(
        children: [
          const SearchAppBar(),
          const SizedBox(height: 32),
          const SearchTextField(),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: listOfTransactionTypes.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 22,
              ),
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
      ),
    );
  }
}
