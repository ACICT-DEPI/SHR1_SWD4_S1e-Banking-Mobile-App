import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';
import 'home/presentation/views/home_view.dart';
import 'home/presentation/views/widgets/CustomNavigationBar.dart';
import 'home/presentation/views/widgets/HomePageAppbarDesign.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  final List<Widget> screens = [
    HomeView(),
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
      bottomNavigationBar: Customnavigationbar(
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
