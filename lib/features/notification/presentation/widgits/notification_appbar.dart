import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';

class NotificationAppBar extends StatelessWidget {
  final String title;
  final IconData? rightIcon;
  final Function()? onClearAllPressed;
  final Function()? onarrowPressed;


  const NotificationAppBar({
    Key? key,
    required this.title,
    this.rightIcon = Icons.delete_outline,
    this.onClearAllPressed,
    this.onarrowPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left spacer (so the title is centered)
          IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.black),
            onPressed: onarrowPressed
          ),
          // Title
          Text(
            title,
            style: TextsStyle.textStyleMedium22.copyWith(color: AppColors.black),
          ),

          // Clear All Button (right icon)
          IconButton(
            icon: Icon(rightIcon, color: AppColors.black),
            onPressed: onClearAllPressed,
          ),
        ],
      ),
    );
  }
}
