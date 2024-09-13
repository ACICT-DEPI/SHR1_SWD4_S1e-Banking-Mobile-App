import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:flutter/material.dart';

class ChangePasswordWidget extends StatelessWidget {
  final String hintText;

  const ChangePasswordWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            top: BorderSide(color: AppColors.greyF4),
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                TextsStyle.textStyleMedium14.copyWith(color: AppColors.greyA7),
            prefixIcon: const Icon(Icons.lock_outline, color: AppColors.greyA7),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye_sharp,
                  color: AppColors.greyA7),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }
}
