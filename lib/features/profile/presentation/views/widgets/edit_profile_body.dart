import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:bank_app/core/widgets/custom_app_bar.dart';
import 'package:bank_app/core/widgets/custom_app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/images.dart';
import 'birth_date_selector.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBar(
            appBarTitle: "Edit Profile",
            onPressedLeft: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back_ios_new_outlined,
          ),
          const SizedBox(height: 32),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(Images.imagesPerson),
          ),
          const SizedBox(height: 50),
          const CustomAppTextFormField(
            title: "Full Name",
            keyboardType: TextInputType.name,
            prefixIcon: Icons.account_circle_outlined,
          ),
          const SizedBox(height: 20),
          const CustomAppTextFormField(
            title: "Email Address",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(height: 20),
          const CustomAppTextFormField(
            title: "Phone Number",
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone,
          ),
          const SizedBox(height: 20),
          const BirthDateSelector(),
          const SizedBox(height: 20),
          Text(
            'Joined at 28 Jan 2021',
            style: TextsStyle.textStyleMedium14.copyWith(
              color: AppColors.greyA7,
            ),
          ),
        ],
      ),
    );
  }
}
