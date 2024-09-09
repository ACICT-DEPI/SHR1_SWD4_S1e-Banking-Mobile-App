import 'package:flutter/material.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';

class CategoryChartAppBar extends StatelessWidget {
  const CategoryChartAppBar({
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
          "Category Chart",
          style: TextsStyle.textStyleMedium18,
        ),
        const SizedBox(width: 24)
      ],
    );
  }
}
