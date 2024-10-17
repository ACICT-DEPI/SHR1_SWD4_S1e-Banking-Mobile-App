import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../generated/l10n.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).AlreadyHaveAccount,
          style: TextsStyle.textStyleRegular14,
        ),
        const SizedBox(width: 4.0),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).SignIn,
            style: TextsStyle.textStyleMedium14.copyWith(
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
