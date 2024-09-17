import 'package:flutter/material.dart';
import '../../authentication/data/models/user_model.dart';
import '../../settings/presentation/views/settings.dart';
import '../../statistics/presentation/views/statistics_view.dart';
import 'cards_screen/cards_screen.dart';
import 'home/presentation/views/home_screen.dart';
import 'home/presentation/views/widgets/custom_navigation_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(
        user: widget.user,
      ),
      const CardsScreen(),
      const StatisticsView(),
      Setting(
        user: widget.user,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: screens[pageIndex],
      ),
      bottomNavigationBar: CustomNavigationBar(
        bottomNavIndex: pageIndex,
        onTap: (int newIndex) {
          setState(() {
            pageIndex = newIndex;
          });
        },
      ),
    );
  }
}
