import 'package:flutter/material.dart';

import '../../../../../core/local/local_settings.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class BiometricSwitchButton extends StatelessWidget {
  const BiometricSwitchButton({
    super.key,
    this.onChanged,
    required this.value,
  });

  final Function(bool)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Biometric",
          style: TextsStyle.textStyleMedium16,
        ),
        const Spacer(
          flex: 4,
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.blue,
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: (LocalSettings.getSettings().themeMode == 'Light')
              ? AppColors.greyA7
              : AppColors.grey8D,
        )
      ],
    );
  }
}
