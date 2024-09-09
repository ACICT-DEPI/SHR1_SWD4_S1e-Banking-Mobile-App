import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../features/transaction_history/data/models/transaction_item_model.dart';

class Functions {
  static List<String> getLastSixMonths() {
    DateTime now = DateTime.now();
    List<String> months = [];

    for (int i = 5; i >= 0; i--) {
      DateTime month = DateTime(now.year, now.month - i);
      months.add(DateFormat.MMM().format(month));
    }

    return months;
  }

  static double getMaxBalance(List<double> last6MonthsBalance) {
    if (last6MonthsBalance.isEmpty) return 0;
    return last6MonthsBalance.reduce((a, b) => a > b ? a : b);
  }

  static Icon getTransactionIcon(TransactionType transactionType) {
    switch (transactionType) {
      case TransactionType.spotify:
        return const Icon(
          FontAwesomeIcons.spotify,
          color: AppColors.green47,
        );
      case TransactionType.appleStore:
        return const Icon(FontAwesomeIcons.apple);
      case TransactionType.moneyTransfer:
        return const Icon(FontAwesomeIcons.moneyBillTransfer);
      case TransactionType.paypal:
        return const Icon(FontAwesomeIcons.paypal);
      case TransactionType.amazonPay:
        return const Icon(FontAwesomeIcons.amazonPay);
      case TransactionType.googlePlay:
        return const Icon(FontAwesomeIcons.googlePlay);
      case TransactionType.grocery:
        return const Icon(
          Icons.shopping_cart_outlined,
        );
      default:
        return const Icon(FontAwesomeIcons.moneyBillTransfer);
    }
  }

  static String getTransactionTitle(TransactionType transactionType) {
    switch (transactionType) {
      case TransactionType.spotify:
        return "Spotify";
      case TransactionType.appleStore:
        return "Apple Store";
      case TransactionType.moneyTransfer:
        return "Money Transfer";
      case TransactionType.grocery:
        return "Grocery";
      case TransactionType.googlePlay:
        return "Google Play";
      case TransactionType.amazonPay:
        return "Amazon Pay";
      case TransactionType.paypal:
        return "Paypal";
      default:
        return "Money Transfer";
    }
  }

  static String getTransactionSubTitle(TransactionType transactionType) {
    switch (transactionType) {
      case TransactionType.spotify:
        return "Music";
      case TransactionType.appleStore:
        return "Entertainment";
      case TransactionType.moneyTransfer:
        return "Transaction";
      case TransactionType.grocery:
        return "Shopping";
      case TransactionType.googlePlay:
        return "Entertainment";
      case TransactionType.amazonPay:
        return "Shopping";
      case TransactionType.paypal:
        return "Transaction";
      default:
        return "Transaction";
    }
  }
}
