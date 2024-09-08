import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account.",
          style: TextsStyle.textStyleRegular14,
        ),
        const SizedBox(width: 4.0),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Sign In",
            style: TextsStyle.textStyleMedium14.copyWith(
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
