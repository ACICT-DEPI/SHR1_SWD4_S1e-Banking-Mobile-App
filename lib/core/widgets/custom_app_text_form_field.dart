import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../local/local_settings.dart';
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
    this.onPressedIcon,
    this.textEditingController,
    this.enable,
    this.validator,
  });

  final String title;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool? obscureText;
  final bool? enable;
  final Function()? onPressedIcon;
  final String? Function(String?)? validator;
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
                validator: validator ??
                    (value) {
                      if (value!.isEmpty) {
                        return S.of(context).FieldRequired;
                      }
                      if (obscureText ?? false) {
                        if (value.trim().length < 8) {
                          return S.of(context).PasswordMustBe8AtLeast;
                        } else if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
                          return S.of(context).PasswordMustContainOneLetter;
                        } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
                          return S
                              .of(context)
                              .PasswordMustContainOneSpecialCharacter;
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
                  color: (LocalSettings.getSettings().themeMode == "Light" ||
                          LocalSettings.getSettings().themeMode == "فاتح")
                      ? AppColors.black
                      : AppColors.white,
                ),
                keyboardType: keyboardType,
              ),
            ),
            if (obscureText != null)
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    (LocalSettings.getSettings().themeMode == "Light" ||
                            LocalSettings.getSettings().themeMode == "فاتح")
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                onPressed: onPressedIcon,
                icon: Icon(
                  suffixIcon,
                  color: obscureText! ? AppColors.greyA7 : AppColors.dark,
                  size: 22,
                ),
              ),
          ],
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
