import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/local/local_settings.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../generated/l10n.dart';

class CustomNavigationBar extends StatelessWidget {
  final int bottomNavIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar(
      {super.key, required this.bottomNavIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final double widthFactor = MediaQuery.of(context).size.width / 411;
    final double heightFactor = MediaQuery.of(context).size.height / 890;
    // Create a list of SVG asset paths and corresponding labels
    final List<String> svgIcons = [
      'assets/images/HomeIcon.svg',
      'assets/images/MyCardsIcon.svg',
      'assets/images/MyStatics.svg',
      'assets/images/SettingsIcon.svg',
    ];
    final List<String> labels = [
      S.of(context).Home,
      S.of(context).MyCards,
      S.of(context).MyStatistics,
      S.of(context).Settings,
    ];
    return SizedBox(
      height: 90 * heightFactor, // Adjusted height for responsiveness
      child: AnimatedBottomNavigationBar.builder(
        borderColor: Colors.transparent,
        itemCount: svgIcons.length,
        backgroundColor: (LocalSettings.getSettings().themeMode == "Light" ||
                LocalSettings.getSettings().themeMode == "فاتح")
            ? AppColors.white
            : AppColors.dark,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? AppColors.blue : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgIcons[index],
                color: color,
                height: 24 * heightFactor, // Adjusted height of icons
              ),
              SizedBox(height: 4 * heightFactor),
              // Adjusted spacing between icon and text
              Text(
                labels[index],
                style: TextStyle(
                  color: color,
                  fontSize: 12 * widthFactor, // Adjusted font size
                ),
              ),
            ],
          );
        },
        activeIndex: bottomNavIndex,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.none,
        onTap: onTap, // Use the callback here to notify the parent widget
      ),
    );
  }
}
