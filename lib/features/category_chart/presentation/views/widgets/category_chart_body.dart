import 'package:flutter/material.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';
import '../../../data/models/category_model.dart';
import 'categories_row.dart';
import 'category_chart_app_bar.dart';
import 'circular_chart.dart';
import 'transaction_history_items.dart';

class CategoryChartBody extends StatelessWidget {
  const CategoryChartBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> listOfModels = [
      CategoryModel(category: "Transaction", percentage: 40),
      CategoryModel(category: "Entertainment", percentage: 10),
      CategoryModel(category: "Music", percentage: 5),
      CategoryModel(category: "Shopping", percentage: 45),
    ];
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
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
      child: Column(
        children: [
          const CategoryChartAppBar(),
          const SizedBox(height: 30),
          CircularChart(
            firstsColor: CategoryModel.firstsCategoryColor,
            secondsColor: CategoryModel.secondsCategoryColor,
            categoryModels: listOfModels,
          ),
          const SizedBox(height: 40.0),
          CategoriesRow(
            length: 4,
            secondsColor: CategoryModel.secondsCategoryColor,
            firstsColor: CategoryModel.firstsCategoryColor,
            categoryModels: listOfModels,
          ),
          const Divider(height: 40.0),
          Expanded(
            child: TransactionHistoryItems(
              listOfAmounts: listOfAmounts,
              listOfTransactionTypes: listOfTransactionTypes,
            ),
          )
        ],
      ),
    );
  }
}
