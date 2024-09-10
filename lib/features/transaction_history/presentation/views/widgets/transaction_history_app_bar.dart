import 'package:flutter/material.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';

class TransactionHistoryAppBar extends StatelessWidget {
  const TransactionHistoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppIconButton(
          icon: Icons.arrow_back_ios_new_outlined,
          onPressed: () {},
        ),
        const Text(
          "Transaction History",
          style: TextsStyle.textStyleMedium18,
        ),
        CustomAppIconButton(
          icon: Icons.history_outlined,
          onPressed: () {},
        )
      ],
    );
  }
}
