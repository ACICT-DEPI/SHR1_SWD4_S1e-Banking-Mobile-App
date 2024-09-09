import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
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
          "Search",
          style: TextsStyle.textStyleMedium18,
        ),
        const SizedBox(width: 24)
      ],
    );
  }
}
