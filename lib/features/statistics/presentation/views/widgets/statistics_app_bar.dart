import 'package:flutter/material.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';

class StatisticsAppBar extends StatelessWidget {
  const StatisticsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppIconButton(
          icon: Icons.arrow_back_ios_new_outlined,
          onPressed: () {},
        ),
        const Text(
          "Statistics",
          style: TextsStyle.textStyleMedium18,
        ),
        CustomAppIconButton(
          icon: Icons.notifications_none,
          onPressed: () {},
        )
      ],
    );
  }
}
