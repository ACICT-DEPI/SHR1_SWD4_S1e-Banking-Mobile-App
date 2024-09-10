import 'package:flutter/material.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';

class CardsPageHeader extends StatelessWidget {
  const CardsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button
        CustomAppIconButton(
          icon: Icons.arrow_back_ios_new_outlined,
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // Title
        const Text(
          "My Cards",
          style: TextsStyle.textStyleMedium18,
        ),

        // Add button
        CustomAppIconButton(
          icon: Icons.add,
          onPressed: () {
            // Add card action
          },
        ),
      ],
    );
  }
}
