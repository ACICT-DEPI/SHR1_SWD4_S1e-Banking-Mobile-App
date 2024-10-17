import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';

import '../../features/navigation_screen/data/models/card_model.dart';
import '../../features/transaction_history/data/models/transaction_item_model.dart';
import '../../generated/l10n.dart';
import '../local/local_settings.dart';

class Functions {
  static List<String> getDateLastSixMonths() {
    DateTime now = DateTime.now();
    List<String> months = [];

    for (int i = 5; i >= 0; i--) {
      DateTime month = DateTime(now.year, now.month - i);
      months.add(DateFormat.MMM('en').format(month));
    }

    return months;
  }

  static String getCurrentMonth() {
    return DateFormat.MMM('en').format(DateTime.now());
  }

  static double getMaxBalance(List<double> last6MonthsBalance) {
    if (last6MonthsBalance.isEmpty) return 0;
    return last6MonthsBalance.reduce((a, b) => a > b ? a : b);
  }

  static IconData getTransactionIcon(TransactionType transactionType) {
    switch (transactionType) {
      case TransactionType.spotify:
        return FontAwesomeIcons.spotify;
      case TransactionType.appleStore:
        return FontAwesomeIcons.apple;
      case TransactionType.moneyTransfer:
        return FontAwesomeIcons.moneyBillTransfer;
      case TransactionType.paypal:
        return FontAwesomeIcons.paypal;
      case TransactionType.amazonPay:
        return FontAwesomeIcons.amazonPay;
      case TransactionType.googlePlay:
        return FontAwesomeIcons.googlePlay;
      case TransactionType.grocery:
        return Icons.shopping_cart_outlined;
      case TransactionType.netflix:
        return Icons.tv;
      case TransactionType.uber:
        return Icons.directions_car;
      case TransactionType.waterBill:
        return Icons.water;
      case TransactionType.homeInternet:
        return Icons.router;
      case TransactionType.mobileBill:
        return Icons.phone_android;
      case TransactionType.mobileRecharge:
        return Icons.mobile_friendly;
      case TransactionType.socialInsurance:
        return (Icons.family_restroom);
      case TransactionType.fawryPay:
        return (Icons.payment);
      case TransactionType.landline:
        return (Icons.call);
      case TransactionType.electricity:
        return (Icons.electric_bolt);
      case TransactionType.financeAndBanks:
        return (Icons.account_balance);
      case TransactionType.donations:
        return (Icons.volunteer_activism);
      case TransactionType.games:
        return (Icons.gamepad);
      case TransactionType.gas:
        return (Icons.local_fire_department);
      case TransactionType.tickets:
        return (Icons.confirmation_num);
      case TransactionType.microfinance:
        return (Icons.attach_money);
      case TransactionType.education:
        return (Icons.school);
      case TransactionType.saveGaza:
        return (Icons.flag);
      case TransactionType.dailyWaste:
        return (Icons.delete);
      case TransactionType.payments:
        return (Icons.money);
      case TransactionType.unions:
        return (Icons.badge);
      default:
        return (FontAwesomeIcons.moneyBillTransfer);
    }
  }

  static String getTransactionTitle(
      TransactionType transactionType, BuildContext context) {
    switch (transactionType) {
      case TransactionType.spotify:
        return S.of(context).Spotify;
      case TransactionType.appleStore:
        return S.of(context).AppleStore;
      case TransactionType.moneyTransfer:
        return S.of(context).MoneyTransfer;
      case TransactionType.grocery:
        return S.of(context).Grocery;
      case TransactionType.googlePlay:
        return S.of(context).GooglePlay;
      case TransactionType.amazonPay:
        return S.of(context).AmazonPay;
      case TransactionType.paypal:
        return S.of(context).Paypal;
      case TransactionType.netflix:
        return S.of(context).Netflix;
      case TransactionType.uber:
        return S.of(context).Uber;
      case TransactionType.waterBill:
        return S.of(context).WaterBill;
      case TransactionType.homeInternet:
        return S.of(context).HomeInternet;
      case TransactionType.mobileBill:
        return S.of(context).MobileBill;
      case TransactionType.mobileRecharge:
        return S.of(context).MobileRecharge;
      case TransactionType.socialInsurance:
        return S.of(context).SocialInsurance;
      case TransactionType.fawryPay:
        return S.of(context).FawryPay;
      case TransactionType.landline:
        return S.of(context).Landline;
      case TransactionType.electricity:
        return S.of(context).Electricity;
      case TransactionType.financeAndBanks:
        return S.of(context).FinanceAndBanks;
      case TransactionType.donations:
        return S.of(context).Donations;
      case TransactionType.games:
        return S.of(context).Games;
      case TransactionType.gas:
        return S.of(context).Gas;
      case TransactionType.tickets:
        return S.of(context).Tickets;
      case TransactionType.microfinance:
        return S.of(context).Microfinance;
      case TransactionType.education:
        return S.of(context).Education;
      case TransactionType.saveGaza:
        return S.of(context).SaveGaza;
      case TransactionType.dailyWaste:
        return S.of(context).DailyWaste;
      case TransactionType.payments:
        return S.of(context).Payments;
      case TransactionType.unions:
        return S.of(context).Unions;
      default:
        return S.of(context).MoneyTransfer;
    }
  }

  static String getTransactionSubTitle(
      TransactionType transactionType, BuildContext context) {
    switch (transactionType) {
      case TransactionType.spotify:
      case TransactionType.appleStore:
      case TransactionType.googlePlay:
      case TransactionType.netflix:
      case TransactionType.games:
        return S.of(context).Entertainment;

      case TransactionType.waterBill:
      case TransactionType.electricity:
      case TransactionType.gas:
      case TransactionType.dailyWaste:
        return S.of(context).Utilities;

      case TransactionType.moneyTransfer:
      case TransactionType.paypal:
      case TransactionType.amazonPay:
      case TransactionType.financeAndBanks:
      case TransactionType.fawryPay:
      case TransactionType.donations:
      case TransactionType.payments:
        return S.of(context).FinancialServices;

      case TransactionType.homeInternet:
      case TransactionType.mobileBill:
      case TransactionType.landline:
      case TransactionType.mobileRecharge:
        return S.of(context).Telecommunication;

      case TransactionType.grocery:
        return S.of(context).Shopping;
      case TransactionType.uber:
        return S.of(context).Transport;

      default:
        return S.of(context).FinancialServices;
    }
  }

  static TransactionType getTransactionType(String transactionTitle) {
    switch (transactionTitle) {
      case "Spotify":
      case "سبوتيفاي":
        return TransactionType.spotify;
      case "Apple Store":
      case "متجر آبل":
        return TransactionType.appleStore;
      case "Money Transfer":
      case "تحويل الأموال":
        return TransactionType.moneyTransfer;
      case "Grocery":
      case "بقالة":
        return TransactionType.grocery;
      case "Google Play":
      case "جوجل بلاي":
        return TransactionType.googlePlay;
      case "Amazon Pay":
      case "أمازون باي":
        return TransactionType.amazonPay;
      case "Paypal":
      case "بايبال":
        return TransactionType.paypal;
      case "Netflix":
      case "نتفليكس":
        return TransactionType.netflix;
      case "Uber":
      case "أوبر":
        return TransactionType.uber;
      case "Water Bill":
      case "فاتورة المياه":
        return TransactionType.waterBill;
      case "Home Internet":
      case "إنترنت منزلي":
        return TransactionType.homeInternet;
      case "Mobile Bill":
      case "فاتورة الهاتف المحمول":
        return TransactionType.mobileBill;
      case "Mobile Recharge":
      case "شحن الهاتف المحمول":
        return TransactionType.mobileRecharge;
      case "Social Insurance":
      case "التأمين الاجتماعي":
        return TransactionType.socialInsurance;
      case "Fawry Pay":
      case "فوري باي":
        return TransactionType.fawryPay;
      case "Landline":
      case "خط أرضي":
        return TransactionType.landline;
      case "Electricity":
      case "الكهرباء":
        return TransactionType.electricity;
      case "Finance and Banks":
      case "المالية والبنوك":
        return TransactionType.financeAndBanks;
      case "Donations":
      case "التبرعات":
        return TransactionType.donations;
      case "Games":
      case "الألعاب":
        return TransactionType.games;
      case "Gas":
      case "غاز":
        return TransactionType.gas;
      case "Tickets":
      case "تذاكر":
        return TransactionType.tickets;
      case "Microfinance":
      case "تمويل صغير":
        return TransactionType.microfinance;
      case "Education":
      case "التعليم":
        return TransactionType.education;
      case "Save Gaza":
      case "أنقذ غزة":
        return TransactionType.saveGaza;
      case "Daily Waste":
      case "النفايات اليومية":
        return TransactionType.dailyWaste;
      case "Payments":
      case "المدفوعات":
        return TransactionType.payments;
      case "Unions":
      case "النقابات":
        return TransactionType.unions;
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
    List<DateTime> last7Days = [];
    if (days == 7) {
      last7Days = List.generate(
        6,
        (i) => today.subtract(
          Duration(days: i + 1),
        ),
      );
    } else {
      last7Days = List.generate(
        23,
        (i) => today.subtract(
          Duration(days: i + 7),
        ),
      );
    }

    return last7Days.reversed.toList();
  }

  static List<TransactionItemModel> searchInTransactions(
      List<TransactionItemModel> transactions,
      String title,
      BuildContext context) {
    List<TransactionItemModel> searchResult = [];

    for (var trans in transactions) {
      if (getTransactionTitle(trans.type, context)
          .toLowerCase()
          .contains(title.toLowerCase())) {
        searchResult.add(trans);
      }
    }

    return searchResult;
  }

  static double getTransactionPercent(String type,
      List<TransactionItemModel> allTransactions, BuildContext context) {
    int numOfTransactionType = 0;

    for (var trans in allTransactions) {
      if (type == getTransactionSubTitle(trans.type, context)) {
        numOfTransactionType++;
      }
    }

    double percent = numOfTransactionType / allTransactions.length;
    percent = (percent == 0) ? 0.00001 : percent;
    return percent * 100;
  }

  static String timeAgo(DateTime dateTime, BuildContext context) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return S.of(context).JustNow;
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${S.of(context).MinutesAgo}';
    } else if (difference.inHours < 24) {
      if (difference.inHours == 1) {
        return S.of(context).HourAgo;
      } else {
        return '${difference.inHours} ${S.of(context).HoursAgo}';
      }
    } else if (difference.inDays == 1) {
      return S.of(context).Yesterday;
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${S.of(context).DaysAgo}';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return weeks == 1
          ? S.of(context).WeekAgo
          : '$weeks ${S.of(context).WeeksAgo}';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return months == 1
          ? S.of(context).MonthAgo
          : '$months ${S.of(context).MonthsAgo}';
    } else {
      final years = (difference.inDays / 365).floor();
      return years == 1
          ? S.of(context).YearAgo
          : '$years ${S.of(context).YearsAgo}';
    }
  }

  static IconData getNotificationIcon(String title) {
    switch (title) {
      case 'Payment Received':
        return Icons.monetization_on;
      case 'New Promotional Offer':
        return Icons.local_offer;
      default:
        return Icons.notification_important_outlined;
    }
  }

  static Future<bool> checkBiometricSupport() async {
    final LocalAuthentication auth = LocalAuthentication();

    try {
      // Check if the device supports biometric authentication
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      if (!canCheckBiometrics) {
        return false; // No biometric support at all
      }
      // Get the available biometric types
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      // Check if fingerprint is supported
      return availableBiometrics.contains(BiometricType.fingerprint) ||
          availableBiometrics.contains(BiometricType.strong);
    } catch (e) {
      return false; // Return false if any error occurs
    }
  }

  /// Get the device's current language as 'English' or 'Arabic' without using context
  static String getDeviceLanguage() {
    // Get the system locale
    Locale deviceLocale = PlatformDispatcher.instance.locale;

    // Check if the device language is Arabic ('ar'), otherwise return 'English'
    if (deviceLocale.languageCode == 'ar') {
      return 'العربية';
    } else {
      return 'English'; // Default to English for other languages
    }
  }

  static String getLanguageCode(String language) {
    if (language == 'English') {
      return 'en';
    } else {
      return 'ar';
    }
  }

  // Method to check if a user is currently logged in
  static bool isUserLogin() {
    return LocalSettings.getSettings().isLogIn;
  }
}
