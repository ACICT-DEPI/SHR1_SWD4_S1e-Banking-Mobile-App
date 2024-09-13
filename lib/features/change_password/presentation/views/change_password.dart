import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/change_password_widget.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
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
              const ChangePasswordWidget(hintText: "Current Password"),
              const ChangePasswordWidget(hintText: "New Password"),
              const ChangePasswordWidget(hintText: "Confirm New Password"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Both Passwords Must Match",
                  style: TextsStyle.textStyleMedium14
                      .copyWith(color: AppColors.greyA7),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 335,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Change Password",
                      style: TextsStyle.textStyleMedium16
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
