import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../features/navigation_screen/data/models/card_model.dart';
import '../../features/transaction_history/data/models/transaction_item_model.dart';
import '../styles/colors.dart';

class Functions {
  static List<String> getDateLastSixMonths() {
    DateTime now = DateTime.now();
    List<String> months = [];

    for (int i = 5; i >= 0; i--) {
      DateTime month = DateTime(now.year, now.month - i);
      months.add(DateFormat.MMM().format(month));
    }

    return months;
  }

  static String getCurrentMonth() {
    return DateFormat.MMM().format(DateTime.now());
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

  static TransactionType getTransactionType(String transactionTitle) {
    switch (transactionTitle) {
      case "Spotify":
        return TransactionType.spotify;
      case "Apple Store":
        return TransactionType.appleStore;
      case "Money Transfer":
        return TransactionType.moneyTransfer;
      case "Grocery":
        return TransactionType.grocery;
      case "Google Play":
        return TransactionType.googlePlay;
      case "Amazon Pay":
        return TransactionType.amazonPay;
      case "Paypal":
        return TransactionType.paypal;
      default:
        return TransactionType.moneyTransfer;
    }
  }

  static String getCurrentDate() {
    DateTime date = DateTime.now();

    // Create a DateFormat instance
    DateFormat formatter = DateFormat('dd MMM yyyy');

    // Format the date
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static Future<double> calculateCurrentBalance(List<CardModel> cards) async {
    double currentBalance = 0;
    for (var card in cards) {
      currentBalance += card.cardBalance;
    }
    return currentBalance;
  }

  static List<TransactionItemModel> getToDayTransactions(
      List<TransactionItemModel> transactions) {
    List<TransactionItemModel> toDayTransactions = [];
    for (var trans in transactions) {
      if (trans.createdAt.day == DateTime.now().day) {
        toDayTransactions.add(trans);
      }
    }
    return toDayTransactions;
  }

  static List<TransactionItemModel> getLastDaysTransactions(
      List<TransactionItemModel> transactions, int days) {
    List<TransactionItemModel> toDayTransactions = [];
    List<DateTime> lastDaysDateTime = _getLastDaysDateTime(days);
    for (var trans in transactions) {
      for (var date in lastDaysDateTime) {
        if (trans.createdAt.day == date.day) {
          toDayTransactions.add(trans);
          break;
        }
      }
    }
    return toDayTransactions;
  }

  static List<DateTime> _getLastDaysDateTime(int days) {
    DateTime today = DateTime.now();
    List<DateTime> last7Days = List.generate(
      days,
      (i) => today.subtract(
        Duration(days: i),
      ),
    );

    return last7Days.reversed.toList();
  }
}
