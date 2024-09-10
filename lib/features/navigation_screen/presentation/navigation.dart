import 'package:flutter/material.dart';
import '../../statistics/presentation/views/statistics_view.dart';
import 'cards_screen/cards_screen.dart';
import 'home/presentation/views/home_screen.dart';
import 'home/presentation/views/widgets/custom_navigation_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CardsScreen(),
    const StatisticsView(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
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
