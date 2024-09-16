import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class ProfileRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed;

  const ProfileRow({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: AppColors.greyA7,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                text,
                style: TextsStyle.textStyleRegular15
                    .copyWith(color: AppColors.black),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.greyA7,
              ),
            ],
          ),
        ),
        const SizedBox(height: 14.0),
        const Divider(
          color: AppColors.greyF4,
          height: 0,
        )
      ],
    );
  }
}
