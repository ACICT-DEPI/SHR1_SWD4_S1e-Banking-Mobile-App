import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:flutter/material.dart';

class MyRow2 extends StatelessWidget {
  final String text;

  const MyRow2({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style:
                TextsStyle.textStyleMedium14.copyWith(color: AppColors.greyA7),
          ),
        ),
      ],
    );
  }
}
