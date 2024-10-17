import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class LoginEmailAndPassword extends StatefulWidget {
  const LoginEmailAndPassword(
      {super.key,
      required this.emailTextController,
      required this.passwordTextController});

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  @override
  State<LoginEmailAndPassword> createState() => _LoginEmailAndPasswordState();
}

class _LoginEmailAndPasswordState extends State<LoginEmailAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppTextFormField(
          textEditingController: widget.emailTextController,
          title: S.of(context).EmailAddress,
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 22),
        CustomAppTextFormField(
          textEditingController: widget.passwordTextController,
          title: S.of(context).Password,
          prefixIcon: Icons.lock_outline,
          obscureText: isObscureText,
          suffixIcon: Icons.remove_red_eye_outlined,
          keyboardType: TextInputType.emailAddress,
          onPressedIcon: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
