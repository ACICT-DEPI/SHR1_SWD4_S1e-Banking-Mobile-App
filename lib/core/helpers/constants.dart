import '../../features/languages/data/models/language_model.dart';
import 'images.dart';

class Constants {
  static final List<String> services = [
    "Spotify",
    "Apple Store",
    "Grocery",
    "Google Play",
    "Amazon Pay",
    "Paypal"
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
}
