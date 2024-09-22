import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SuccessSendingScreenBody extends StatelessWidget {
  const SuccessSendingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          CustomAppBar(
            appBarTitle: "Send Money",
            leftIcon: Icons.arrow_back_ios_new_outlined,
            onPressedLeft: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          Text(
            "Successful",
            style: TextsStyle.textStyleSemiBold35.copyWith(
              color: AppColors.greenC8,
            ),
          ),
        ],
      ),
    );
  }
}
