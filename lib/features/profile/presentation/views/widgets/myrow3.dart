import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class MyRow3 extends StatelessWidget {
  final String text;
  final IconButton icon;

  const MyRow3({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: const Border(
          top: BorderSide(color: AppColors.greyF4, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          Text(
            text,
            style:
                TextsStyle.textStyleMedium14.copyWith(color: AppColors.black),
          ),
          const Spacer(flex: 5),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.greyA7,
            ),
          )
        ],
      ),
    );
  }
}
