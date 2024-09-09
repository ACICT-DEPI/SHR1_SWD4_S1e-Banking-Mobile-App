import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double spacing = 40.0;
  final EdgeInsets padding=const EdgeInsets.symmetric(horizontal: 16.0);

  const OnboardingPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  // Define text styles as constants for consistency and reuse

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: spacing),
          SvgPicture.asset(imagePath, width: 350, height: 250),
          SizedBox(height: spacing),
          Column(
            children: [
              AutoSizeText(
                title,
                textAlign: TextAlign.center,
                style: TextsStyle.textStyleSemiBold26,
              ),
              const SizedBox(height: 10), // Optional space between texts
              AutoSizeText(
                description,
                textAlign: TextAlign.center,
                style:TextsStyle.textStyleMedium14.copyWith(color: AppColors.grey8D),
              ),
            ],
          ),
          SizedBox(height: spacing),
        ],
      ),
    );
  }
}
