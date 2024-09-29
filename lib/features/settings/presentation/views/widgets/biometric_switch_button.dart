import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
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
            inactiveTrackColor: AppColors.greyA7,
          )
        ],
      ),
    );
  }
}
