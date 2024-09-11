import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';

// Assuming these are defined elsewhere in your codebase

class SendMoneyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  SendMoneyAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        'Send Money',
        style: TextsStyle.textStyleMedium18.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
