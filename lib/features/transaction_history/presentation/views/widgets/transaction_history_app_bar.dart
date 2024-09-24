import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class TransactionHistoryAppBar extends StatelessWidget {
  const TransactionHistoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      appBarTitle: "Transaction History",
      onPressedLeft: () {
        Navigator.pop(context);
      },
      leftIcon: Icons.arrow_back_ios_new_outlined,
    );
  }
}
