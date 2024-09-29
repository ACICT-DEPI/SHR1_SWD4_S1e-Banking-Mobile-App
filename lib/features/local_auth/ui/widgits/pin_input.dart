import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter/material.dart';

class PinCircles extends StatelessWidget {
  final String enteredPin;

  const PinCircles({super.key, required this.enteredPin});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: CircleAvatar(
            radius: 8,
            backgroundColor:
                index < enteredPin.length ? AppColors.blue : AppColors.greyA7,
          ),
        );
      }),
    );
  }
}
