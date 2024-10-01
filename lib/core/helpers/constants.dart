import '../../features/languages/data/models/language_model.dart';
import '../../features/transaction_history/data/models/transaction_item_model.dart';
import 'images.dart';

class Constants {
  static final List<TransactionType> services = [
    TransactionType.homeInternet,
    TransactionType.mobileBill,
    TransactionType.mobileRecharge,
    TransactionType.socialInsurance,
    TransactionType.fawryPay,
    TransactionType.landline,
    TransactionType.electricity,
    TransactionType.financeAndBanks,
    TransactionType.donations,
    TransactionType.games,
    TransactionType.gas,
    TransactionType.tickets,
    TransactionType.uber,
    TransactionType.education,
    TransactionType.dailyWaste,
    TransactionType.googlePlay,
    TransactionType.amazonPay,
    TransactionType.paypal
  ];

  static List<LanguageModel> languages = [
    LanguageModel(
      languageImage: Images.imagesArabic,
      languageName: 'العربية',
    ),
    LanguageModel(
      languageImage: Images.imagesEnglish,
      languageName: 'English',
    ),
  ];
  static List<String> themes = ['Light', 'Dark'];
}
