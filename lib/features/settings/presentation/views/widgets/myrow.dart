import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  final String text;
  final IconButton icon;
  final String? label;

  const MyRow({super.key, required this.text, required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: const Border(
          top: BorderSide(color: AppColors.greyF4, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:
                TextsStyle.textStyleMedium14.copyWith(color: AppColors.black),
          ),
          const Spacer(flex: 4),
          if (label != null)
            Text(label!,
                style: TextsStyle.textStyleMedium14
                    .copyWith(color: AppColors.greyA7)),
          const Spacer(flex: 1),
          icon,
        ],
      ),
    );
  }
}
