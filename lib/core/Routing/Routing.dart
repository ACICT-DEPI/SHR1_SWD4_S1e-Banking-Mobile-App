import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/add_new_card_page/presentation/add_card_page.dart';
import '../../features/all_cards_screen/presentation/views/all_cards_screen.dart';
import '../../features/authentication/presentation/views/login_view.dart';
import '../../features/authentication/presentation/views/signup_view.dart';
import '../../features/category_chart/presentation/views/category_chart_view.dart';
import '../../features/change_password/presentation/views/change_password.dart';
import '../../features/languages/presentation/views/languges.dart';
import '../../features/navigation_screen/presentation/navigation.dart';
import '../../features/onboardingScreen/presentation/onboarding_screen.dart';
import '../../features/privacy_policy/presentation/views/privacy_policy.dart';
import '../../features/profile/presentation/views/edit_profile.dart';
import '../../features/profile/presentation/views/profile.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/send_money_screen/presentation/send_money_screen.dart';
import '../../features/settings/presentation/views/settings.dart';
import '../../features/statistics/presentation/views/statistics_view.dart';
import '../../features/transaction_history/presentation/views/transaction_history_view.dart';

class Routing {
  static String onboardingScreen = '/OnboardingScreen';
  static String addCardScreen = '/AddCardScreen';
  static String allCardsScreen = '/AllCardsScreen';
  static String loginView = '/LoginView';
  static String signupView = '/SignupView';
  static String categoryChart = '/CategoryChart';
  static String changePassword = '/ChangePassword';
  static String languages = '/Languages';
  static String navigationScreen = '/NavigationScreen';
  static String privacyPolicy = '/PrivacyPolicy';
  static String editProfileScreen = '/EditProfileScreen';
  static String profile = '/Profile';
  static String searchView = '/SearchView';
  static String sendMoneyScreen = '/SendMoneyScreen';
  static String setting = '/Setting';
  static String statisticsView = '/StatisticsView';
  static String transactionHistoryView = '/TransactionHistoryView';

  static final GoRouter _router = GoRouter(
    initialLocation: onboardingScreen, // Set your initial route here

    routes: <RouteBase>[
      GoRoute(
        path: onboardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
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
        path: categoryChart,
        builder: (BuildContext context, GoRouterState state) {
          return const CategoryChart();
        },
      ),
      GoRoute(
        path: changePassword,
        builder: (BuildContext context, GoRouterState state) {
          return const ChangePassword();
        },
      ),
      GoRoute(
        path: languages,
        builder: (BuildContext context, GoRouterState state) {
          return const Languages();
        },
      ),
      GoRoute(
        path: navigationScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const NavigationScreen();
        },
      ),
      GoRoute(
        path: privacyPolicy,
        builder: (BuildContext context, GoRouterState state) {
          return const PrivacyPolicy();
        },
      ),
      GoRoute(
        path: editProfileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const EditProfileScreen();
        },
      ),
      GoRoute(
        path: profile,
        builder: (BuildContext context, GoRouterState state) {
          return const Profile();
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
        path: setting,
        builder: (BuildContext context, GoRouterState state) {
          return const Setting();
        },
      ),
      GoRoute(
        path: statisticsView,
        builder: (BuildContext context, GoRouterState state) {
          return const StatisticsView();
        },
      ),
      GoRoute(
        path: transactionHistoryView,
        builder: (BuildContext context, GoRouterState state) {
          return const TransactionHistoryView();
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
