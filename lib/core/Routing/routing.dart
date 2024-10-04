import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/add_new_card_page/presentation/add_card_page.dart';
import '../../features/all_cards_screen/presentation/views/all_cards_screen.dart';
import '../../features/authentication/presentation/views/login_view.dart';
import '../../features/authentication/presentation/views/signup_view.dart';
import '../../features/change_password/presentation/views/change_password.dart';
import '../../features/contact_us/presentation/views/contact_us_view.dart';
import '../../features/languages/presentation/views/languages_view.dart';
import '../../features/local_auth/ui/local_auth.dart';
import '../../features/navigation_screen/presentation/navigation.dart';
import '../../features/notification/presentation/notifications_screen.dart';
import '../../features/onboardingScreen/presentation/onboarding_screen.dart';
import '../../features/privacy_policy/presentation/views/privacy_policy_view.dart';
import '../../features/profile/presentation/views/edit_profile.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/receive_money/presentation/receive_money_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/send_money_screen/data/models/success_model.dart';
import '../../features/send_money_screen/presentation/scan_qr_sacn_screen.dart';
import '../../features/send_money_screen/presentation/send_money_screen.dart';
import '../../features/send_money_screen/presentation/success_sending_screen.dart';
import '../../features/service/presentation/service_view.dart';
import '../../features/service/presentation/widgets/service_view_body.dart';
import '../../features/settings/data/models/settings_model.dart';
import '../../features/theme/presentation/views/theme_view.dart';
import '../../features/transaction_history/data/models/transaction_item_model.dart';
import '../../features/transaction_history/presentation/views/transaction_history_view.dart';
import '../local/local_settings.dart';
import '../network/firebase_authentication.dart';
import '../network/firebase_cards.dart';
import '../widgets/error_screen.dart';

class Routing {
  static String onboardingScreen = '/OnboardingScreen';
  static String addCardScreen = '/AddCardScreen';
  static String allCardsScreen = '/AllCardsScreen';
  static String loginView = '/LoginView';
  static String signupView = '/SignupView';
  static String changePassword = '/ChangePassword';
  static String languagesView = '/LanguagesView';
  static String navigationScreen = '/NavigationScreen';
  static String privacyPolicy = '/PrivacyPolicy';
  static String contactUsView = '/ContactUsView';
  static String editProfileScreen = '/EditProfileScreen';
  static String profileView = '/ProfileView';
  static String searchView = '/SearchView';
  static String sendMoneyScreen = '/SendMoneyScreen';
  static String receiveMoneyView = '/ReceiveMoneyView';
  static String serviceView = '/ServiceView';
  static String transactionHistoryView = '/TransactionHistoryView';
  static String successSendingScreen = '/SuccessSendingScreen';
  static String errorScreen = '/ErrorScreen';
  static String qrScanScreen = '/QrScanScreen';
  static String notificationsScreen = '/NotificationsScreen';
  static String localAuthScreen = '/LocalAuthScreen';
  static String servicesView = '/ServicesView';
  static String themeView = '/ThemeView';

  static final GoRouter _router = GoRouter(
    initialLocation: onboardingScreen, // Set your initial route here

    routes: <RouteBase>[
      GoRoute(
        path: localAuthScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LocalAuthScreen();
        },
      ),
      GoRoute(
        path: onboardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
        redirect: (context, state) async {
          // Synchronous check for user authentication
          if (FirebaseAuthentication.isUserLogin()) {
            SettingsModel model = LocalSettings.getSettings();
            if (model.supportBiometric && model.useBiometric) {
              return localAuthScreen; // Redirect to biometric auth screen
            }
            return navigationScreen; // Redirect to the navigation screen
          }
          return onboardingScreen; // Redirect to login if not authenticated
        },
      ),
      GoRoute(
        path: addCardScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const AddCardScreen();
        },
      ),
      GoRoute(
        path: allCardsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const AllCardsScreen();
        },
      ),
      GoRoute(
        path: loginView,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: signupView,
        builder: (BuildContext context, GoRouterState state) {
          return const SignupView();
        },
      ),
      GoRoute(
        path: changePassword,
        builder: (BuildContext context, GoRouterState state) {
          return const ChangePassword();
        },
      ),
      GoRoute(
        path: languagesView,
        builder: (BuildContext context, GoRouterState state) {
          return const LanguagesView();
        },
      ),
      GoRoute(
        path: navigationScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const NavigationScreen();
        },
        redirect: (context, state) async {
          if (await FirebaseCards.getNumberOfCards() == 0) {
            return allCardsScreen;
          } else {
            return null;
          }
        },
      ),
      GoRoute(
        path: privacyPolicy,
        builder: (BuildContext context, GoRouterState state) {
          return const PrivacyPolicyView();
        },
      ),
      GoRoute(
        path: contactUsView,
        builder: (BuildContext context, GoRouterState state) {
          return const ContactUsView();
        },
      ),
      GoRoute(
        path: editProfileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const EditProfileScreen();
        },
      ),
      GoRoute(
        path: profileView,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileView();
        },
      ),
      GoRoute(
        path: searchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
      GoRoute(
        path: sendMoneyScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SendMoneyScreen();
        },
      ),
      GoRoute(
        path: receiveMoneyView,
        builder: (BuildContext context, GoRouterState state) {
          return const ReceiveMoneyView();
        },
      ),
      GoRoute(
        path: serviceView,
        builder: (BuildContext context, GoRouterState state) {
          TransactionType service = state.extra as TransactionType;
          return ServiceViewBody(
            service: service,
          );
        },
      ),
      GoRoute(
        path: servicesView,
        builder: (BuildContext context, GoRouterState state) {
          return const ServicesView();
        },
      ),
      GoRoute(
        path: qrScanScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const QrScanScreen();
        },
      ),
      GoRoute(
        path: transactionHistoryView,
        builder: (BuildContext context, GoRouterState state) {
          return const TransactionHistoryView();
        },
      ),
      GoRoute(
        path: successSendingScreen,
        builder: (BuildContext context, GoRouterState state) {
          final SuccessModel successModel = state.extra as SuccessModel;
          return SuccessSendingScreen(
            successModel: successModel,
          );
        },
      ),
      GoRoute(
        path: notificationsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationsScreen();
        },
      ),
      GoRoute(
        path: themeView,
        builder: (BuildContext context, GoRouterState state) {
          return const ThemeView();
        },
      ),
      GoRoute(
        path: errorScreen,
        builder: (BuildContext context, GoRouterState state) {
          // Retrieve the ErrorScreenData from state.extra
          final errorScreenData = state.extra as ErrorScreenData;

          return ErrorScreen(
            message: errorScreenData.message,
            onPressed: errorScreenData.onPressed,
          );
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
