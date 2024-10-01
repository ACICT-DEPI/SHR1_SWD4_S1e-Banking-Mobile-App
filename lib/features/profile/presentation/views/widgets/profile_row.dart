import 'package:flutter/material.dart';

import '../../../../../core/local/local_settings.dart';
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
                style: TextsStyle.textStyleRegular15.copyWith(
                  color: (LocalSettings.getSettings().themeMode == 'Light' ||
                      LocalSettings.getSettings().themeMode == 'فاتح')? AppColors.black
                      : AppColors.white,
                ),
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
          height: 0,
        )
      ],
    );
  }
}
