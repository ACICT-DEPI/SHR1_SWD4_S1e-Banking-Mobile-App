import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:flutter/material.dart';

class MyRow4 extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const MyRow4({super.key, required this.hintText, required this.icon});

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
            hintStyle: TextsStyle.textStyleMedium14.copyWith(
              color: AppColors.greyA7,
            ),
            prefixIcon: Icon(
              icon,
              color: AppColors.greyA7,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }
}
