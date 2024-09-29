import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class BiometricSwitchButton extends StatefulWidget {
  const BiometricSwitchButton({
    super.key,
  });

  @override
  State<BiometricSwitchButton> createState() => _BiometricSwitchButtonState();
}

class _BiometricSwitchButtonState extends State<BiometricSwitchButton> {
  bool switchValue = false;

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
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
            activeColor: AppColors.blue,
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: AppColors.greyA7,
          )
        ],
      ),
    );
  }
}
