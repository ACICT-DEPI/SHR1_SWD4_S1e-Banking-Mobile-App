import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/texts_style.dart';

class CustomAppTextFormField extends StatelessWidget {
  const CustomAppTextFormField({
    super.key,
    required this.title,
    required this.keyboardType,
    this.obscureText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onPressedIcon, this.textEditingController, this.enable,
  });

  final String title;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool? obscureText;
  final bool? enable;
  final Function()? onPressedIcon;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextsStyle.textStyleRegular14,
        ),
        Row(
          children: [
            Icon(
              prefixIcon,
              color: AppColors.greyA7,
              size: 22,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: TextFormField(
                enabled: enable,
                controller: textEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  }
                  if (obscureText ?? false) {
                    if (value.length < 8) {
                      return "The password must be 8 at least";
                    }
                    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
                      return "The password must contain at least one letter";
                    }
                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return "The password must contain at least one special character";
                    }
                  }
                  return null;
                },
                obscureText: obscureText ?? false,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextsStyle.textStyleRegular14.copyWith(
                  color: AppColors.black,
                ),
                keyboardType: keyboardType,
              ),
            ),
            if (obscureText != null)
              IconButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.white,
                  ),
                ),
                onPressed: onPressedIcon,
                icon: Icon(
                  suffixIcon,
                  color: obscureText! ? AppColors.greyA7 : AppColors.grey37,
                  size: 22,
                ),
              ),
          ],
        ),
        const Divider(
          color: AppColors.greyF4,
          height: 0,
        ),
      ],
    );
  }
}
