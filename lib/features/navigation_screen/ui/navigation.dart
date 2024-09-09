import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';
import 'home/presentation/views/home_view.dart';
import 'home/presentation/views/widgets/CustomNavigationBar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  final List<Widget> screens = [
    const HomeView(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
