import 'package:bank_app/features/authentication/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class NewUserRow extends StatelessWidget {
  const NewUserRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "I’m a new user.",
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
