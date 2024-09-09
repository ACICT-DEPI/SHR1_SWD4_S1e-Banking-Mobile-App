import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_text_form_field.dart';

class SignUpFields extends StatefulWidget {
  const SignUpFields(
      {super.key,
      required this.nameTextController,
      required this.phoneTextController,
      required this.emailTextController,
      required this.passwordTextController});

  final TextEditingController nameTextController;

  final TextEditingController phoneTextController;

  final TextEditingController emailTextController;

  final TextEditingController passwordTextController;

  @override
  State<SignUpFields> createState() => _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppTextFormField(
          textEditingController: widget.nameTextController,
          title: "Full Name",
          prefixIcon: Icons.person,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 22),
        CustomAppTextFormField(
          textEditingController: widget.phoneTextController,
          title: "Phone Number",
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 22),
        CustomAppTextFormField(
          textEditingController: widget.emailTextController,
          title: "Email Address",
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 22),
        CustomAppTextFormField(
          textEditingController: widget.passwordTextController,
          title: "Password",
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
