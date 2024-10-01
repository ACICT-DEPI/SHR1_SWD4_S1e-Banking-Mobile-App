import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../generated/l10n.dart';
import '../signup_view.dart';

class NewUserRow extends StatelessWidget {
  const NewUserRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).INewUser,
          style: TextsStyle.textStyleRegular14,
        ),
        const SizedBox(width: 4.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupView(),
              ),
            );
          },
          child: Text(
            S.of(context).SignUp,
            style: TextsStyle.textStyleMedium14.copyWith(
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
