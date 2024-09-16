import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class MainSectionTitle extends StatelessWidget {
  final String text;

  const MainSectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextsStyle.textStyleMedium14.copyWith(
        color: AppColors.greyA7,
      ),
    );
  }
}
