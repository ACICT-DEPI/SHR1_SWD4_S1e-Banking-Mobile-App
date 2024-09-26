import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class SpendingLimitSection extends StatefulWidget {
  const SpendingLimitSection({super.key});

  @override
  State<SpendingLimitSection> createState() => _SpendingLimitSectionState();
}

class _SpendingLimitSectionState extends State<SpendingLimitSection> {
  double _currentSliderValue = 8545.00;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Monthly spending limit",
          style: TextsStyle.textStyleSemiBold24.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            color: AppColors.greyF4,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Amount: \$${_currentSliderValue.toStringAsFixed(2)}",
                  style: TextsStyle.textStyleRegular13,
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 10000,
                  activeColor: AppColors.blue,
                  inactiveColor: Colors.grey.shade300,
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
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
                      "\$${_currentSliderValue.toStringAsFixed(2)}",
                      style: TextsStyle.textStyleRegular15.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
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
