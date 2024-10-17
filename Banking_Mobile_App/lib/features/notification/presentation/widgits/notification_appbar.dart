import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class NotificationAppBar extends StatelessWidget {
  final String title;
  final Function()? onClearAllPressed;
  final Function()? onArrowPressed;

  const NotificationAppBar({
    super.key,
    required this.title,
    this.onClearAllPressed,
    this.onArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      appBarTitle: title,
      onPressedRight: onClearAllPressed,
      onPressedLeft: onArrowPressed,
      rightIcon: Icons.delete_forever_sharp,
      leftIcon: Icons.arrow_back,
    );
  }
}
