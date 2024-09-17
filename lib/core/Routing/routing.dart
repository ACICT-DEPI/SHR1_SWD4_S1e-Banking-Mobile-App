import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/add_new_card_page/presentation/add_card_page.dart';
import '../../features/all_cards_screen/presentation/views/all_cards_screen.dart';
import '../../features/authentication/presentation/views/login_view.dart';
import '../../features/authentication/presentation/views/signup_view.dart';
import '../../features/category_chart/presentation/views/category_chart_view.dart';
import '../../features/change_password/presentation/views/change_password.dart';
import '../../features/languages/presentation/views/languages_view.dart';
import '../../features/navigation_screen/presentation/navigation.dart';
import '../../features/onboardingScreen/presentation/onboarding_screen.dart';
import '../../features/privacy_policy/presentation/views/privacy_policy.dart';
import '../../features/profile/presentation/views/edit_profile.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/send_money_screen/presentation/send_money_screen.dart';
import '../../features/transaction_history/presentation/views/transaction_history_view.dart';
import '../network/firebase.dart';

class Routing {
<<<<<<< HEAD:lib/core/Routing/Routing.dart

=======
>>>>>>> 0ab1f9612a7b30bd42fb9aa22db304c1b581c9f9:lib/core/Routing/routing.dart
  static String initialRoute = '/AddCardScreen';
  static String onboardingScreen = '/OnboardingScreen';
  static String addCardScreen = '/AddCardScreen';
  static String allCardsScreen = '/AllCardsScreen';
  static String loginView = '/LoginView';
  static String signupView = '/SignupView';
  static String categoryChart = '/CategoryChart';
  static String changePassword = '/ChangePassword';
  static String languagesView = '/LanguagesView';
  static String navigationScreen = '/NavigationScreen';
  static String privacyPolicy = '/PrivacyPolicy';
  static String editProfileScreen = '/EditProfileScreen';
  static String profileView = '/ProfileView';
  static String searchView = '/SearchView';
  static String sendMoneyScreen = '/SendMoneyScreen';
  static String transactionHistoryView = '/TransactionHistoryView';

  static final GoRouter _router = GoRouter(
<<<<<<< HEAD:lib/core/Routing/Routing.dart
    initialLocation: initialRoute, // Set your initial route here
=======
    initialLocation: onboardingScreen, // Set your initial route here
>>>>>>> 0ab1f9612a7b30bd42fb9aa22db304c1b581c9f9:lib/core/Routing/routing.dart

    routes: <RouteBase>[
      GoRoute(
        path: onboardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
        redirect: (context, state) {
          // Implement the route guard logic here
          if (Firebase.isUserLogin()) {
            return '/NavigationScreen'; // Redirect to login if not authenticated
          }
          return null; // Continue to the requested route if authenticated
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
        path: transactionHistoryView,
        builder: (BuildContext context, GoRouterState state) {
          return const TransactionHistoryView();
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
