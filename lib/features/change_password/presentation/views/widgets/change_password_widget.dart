import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_text_form_field.dart';

class ChangePasswordWidget extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;

  const ChangePasswordWidget(
      {super.key, required this.title, required this.textEditingController});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomAppTextFormField(
      textEditingController: widget.textEditingController,
      title: widget.title,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icons.lock_outline,
      suffixIcon: Icons.remove_red_eye_sharp,
      obscureText: obscureText,
      onPressedIcon: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
    );
  }
}
