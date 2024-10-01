import 'package:flutter/material.dart';

import '../../../../../core/local/local_settings.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../generated/l10n.dart';

class SpendingLimitSection extends StatelessWidget {
  const SpendingLimitSection({
    super.key,
    required this.currentSliderValue,
    this.onChanged,
    this.onChangeEnd,
  });

  final double currentSliderValue;
  final Function(double)? onChanged;
  final Function(double)? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).MonthlySpendingLimit,
          style: TextsStyle.textStyleSemiBold24.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            color: (LocalSettings.getSettings().themeMode == "Light" ||
                    LocalSettings.getSettings().themeMode == "فاتح")
                ? AppColors.greyF4
                : AppColors.dark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "${S.of(context).Amount}: \$${currentSliderValue.toStringAsFixed(2)}",
                  style: TextsStyle.textStyleRegular13,
                ),
                Slider(
                  value: currentSliderValue,
                  min: 0,
                  max: 10000,
                  activeColor: AppColors.blue,
                  inactiveColor: Colors.grey.shade300,
                  onChanged: onChanged,
                  onChangeEnd: onChangeEnd,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$0",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$${currentSliderValue.toStringAsFixed(2)}",
                      style: TextsStyle.textStyleRegular15.copyWith(
                        color: (LocalSettings.getSettings().themeMode ==
                                    "Light" ||
                                LocalSettings.getSettings().themeMode == "فاتح")
                            ? AppColors.black
                            : AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "\$10,000",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
