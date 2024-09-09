import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';
import 'cards_screen/cards_screen.dart';
import 'home/presentation/views/home_view.dart';
import 'home/presentation/views/widgets/custom_navigation_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  final List<Widget> screens = [
    const HomeView(),
    CardsScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[pageIndex],
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
