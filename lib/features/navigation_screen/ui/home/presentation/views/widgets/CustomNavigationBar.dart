import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/styles/colors.dart';

class Customnavigationbar extends StatelessWidget {
  final int bottomNavIndex;
  final ValueChanged<int> onTap;

  Customnavigationbar({super.key, required this.bottomNavIndex, required this.onTap});

  // Create a list of SVG asset paths and corresponding labels
  final List<String> svgIcons = [
    'assets/images/HomeIcon.svg',
    'assets/images/MyCardsIcon.svg',
    'assets/images/MyStatics.svg',
    'assets/images/SettingsIcon.svg',
  ];

  final List<String> labels = [
    'Home',
    'My Cards',
    'My Statistics',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: AnimatedBottomNavigationBar.builder(
        itemCount: svgIcons.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? AppColors.blue : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgIcons[index],
                color: color,
                height: 24, // Adjust the height as needed
              ),
              const SizedBox(height: 4), // Spacing between icon and text
              Text(
                labels[index],
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
        backgroundColor: AppColors.white,
        activeIndex: bottomNavIndex,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.none,
        onTap: onTap, // Use the callback here to notify the parent widget
      ),
    );
  }
}
