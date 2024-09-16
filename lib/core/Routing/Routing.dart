import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/add_new_card_page/presentation/add_card_page.dart';
import '../../features/all_cards_screen/presentation/views/all_cards_screen.dart';
import '../../features/authentication/presentation/views/login_view.dart';
import '../../features/authentication/presentation/views/signup_view.dart';
import '../../features/category_chart/presentation/views/category_chart_view.dart';
import '../../features/change_password/presentation/views/change_password.dart';
import '../../features/languages/presentation/views/languges.dart';
import '../../features/navigation_screen/presentation/home/presentation/views/home_screen.dart';
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

  static String initialRoute = '/OnboardingScreen';

  static final GoRouter _router = GoRouter(
    initialLocation: initialRoute,  // Set your initial route here

    routes: <RouteBase>[
      GoRoute(
        path: '/OnboardingScreen',
        builder: (BuildContext context, GoRouterState state) {
          return  OnboardingScreen();
        },
      ),
      GoRoute(
        path: '/AddCardScreen',
        builder: (BuildContext context, GoRouterState state) {
          return  AddCardScreen();
        },
      ),
      GoRoute(
        path: '/AllCardsScreen',
        builder: (BuildContext context, GoRouterState state) {
          return  AllCardsScreen();
        },
      ),
      GoRoute(
        path: '/LoginView',
        builder: (BuildContext context, GoRouterState state) {
          return  LoginView();
        },
      ),
      GoRoute(
        path: '/SignupView',
        builder: (BuildContext context, GoRouterState state) {
          return  SignupView();
        },
      ),
      GoRoute(
        path: '/CategoryChart',
        builder: (BuildContext context, GoRouterState state) {
          return  CategoryChart();
        },
      ),

      GoRoute(
        path: '/ChangePassword',
        builder: (BuildContext context, GoRouterState state) {
          return  ChangePassword();
        },
      ),

      GoRoute(
        path: '/Languages',
        builder: (BuildContext context, GoRouterState state) {
          return  Languages();
        },
      ),

      GoRoute(
        path: '/NavigationScreen',
        builder: (BuildContext context, GoRouterState state) {
          return  NavigationScreen();
        },
      ), GoRoute(
        path: '/PrivacyPolicy',
        builder: (BuildContext context, GoRouterState state) {
          return  PrivacyPolicy();
        },
      ),
      GoRoute(
        path: '/EditProfileScreen',
        builder: (BuildContext context, GoRouterState state) {
          return  EditProfileScreen();
        },
      ),
      GoRoute(
        path: '/Profile',
        builder: (BuildContext context, GoRouterState state) {
          return  Profile();
        },
      ),
      GoRoute(
        path: '/SearchView',
        builder: (BuildContext context, GoRouterState state) {
          return  SearchView();
        },
      ),
      GoRoute(
        path: '/SendMoneyScreen',
        builder: (BuildContext context, GoRouterState state) {
          return  SendMoneyScreen();
        },
      ),
      GoRoute(
        path: '/Setting',
        builder: (BuildContext context, GoRouterState state) {
          return  Setting();
        },
      ),
      GoRoute(
        path: '/StatisticsView',
        builder: (BuildContext context, GoRouterState state) {
          return  StatisticsView();
        },
      ),
      GoRoute(
        path: '/TransactionHistoryView',
        builder: (BuildContext context, GoRouterState state) {
          return  TransactionHistoryView();
        },
      ),

    ],
  );

  static GoRouter get router => _router;
}
