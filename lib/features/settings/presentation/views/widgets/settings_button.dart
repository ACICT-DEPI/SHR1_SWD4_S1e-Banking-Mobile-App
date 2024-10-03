import 'package:flutter/material.dart';

import '../../../../../core/local/local_settings.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final String? label;

  const SettingsButton(
      {super.key, required this.text, required this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Row(
            children: [
              Text(
                text,
                style: TextsStyle.textStyleMedium16,
              ),
              const Spacer(),
              if (label != null)
                Text(
                  label!,
                  style: TextsStyle.textStyleMedium14.copyWith(
                    color: AppColors.greyA7,
                  ),
                ),
              Icon(
                (LocalSettings.getSettings().language == 'English')
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
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
