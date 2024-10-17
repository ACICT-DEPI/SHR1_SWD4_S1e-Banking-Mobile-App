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
  final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0);

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final double widthFactor = MediaQuery.of(context).size.width / 411;
    final double heightFactor = MediaQuery.of(context).size.height / 890;
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: spacing),
          SvgPicture.asset(
            imagePath,
            height: 250 * heightFactor,
          ),
          SizedBox(height: spacing),
          Column(
            children: [
              SizedBox(
                width: 250 * widthFactor,
                child: AutoSizeText(
                  title,
                  textAlign: TextAlign.center,
                  style: TextsStyle.textStyleSemiBold26,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400 * widthFactor,
                child: AutoSizeText(
                  description,
                  textAlign: TextAlign.center,
                  style: TextsStyle.textStyleMedium14.copyWith(
                    color: AppColors.grey8D,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing),
        ],
      ),
    );
  }
}
