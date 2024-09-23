import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import 'change_password_widget.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  TextEditingController currentPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            appBarTitle: "Change Password",
            onPressedLeft: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back_ios_new_outlined,
          ),
          const SizedBox(height: 50),
          ChangePasswordWidget(
            title: "Current Password",
            textEditingController: currentPasswordController,
          ),
          const SizedBox(height: 30),
          ChangePasswordWidget(
            title: "New Password",
            textEditingController: newPasswordController,
          ),
          const SizedBox(height: 30),
          ChangePasswordWidget(
            title: "Confirm New Password",
            textEditingController: confirmPasswordController,
          ),
          const SizedBox(height: 8),
          Text(
            "Both Passwords Must Match",
            style: TextsStyle.textStyleMedium14.copyWith(
              color: AppColors.greyA7,
            ),
          ),
          const Spacer(),
          CustomAppButton(
            title: "Change Password",
            onPressed: () {},
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
