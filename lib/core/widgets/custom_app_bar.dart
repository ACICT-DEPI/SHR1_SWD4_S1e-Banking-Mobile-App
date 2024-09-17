import 'package:flutter/material.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
    this.rightIcon,
    this.leftIcon,
    this.onPressedRight,
    this.onPressedLeft,
  });

  final String appBarTitle;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final Function()? onPressedRight;
  final Function()? onPressedLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppIconButton(
          icon: leftIcon,
          onPressed: onPressedLeft,
        ),
        Text(
          appBarTitle,
          style: TextsStyle.textStyleMedium22,
        ),
        CustomAppIconButton(
          icon: rightIcon,
          onPressed: onPressedRight,
        ),
      ],
    );
  }
}
