import 'package:flutter/material.dart';

import '../../../../../core/helpers/images.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';
import '../../../../authentication/data/models/user_model.dart';
import 'birth_date_selector.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key, required this.user});

  final UserModel user;

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
          CustomAppTextFormField(
            title: "Full Name",
            keyboardType: TextInputType.name,
            prefixIcon: Icons.account_circle_outlined,
            textEditingController: TextEditingController(text: user.fullName),
            enable: false,
          ),
          const SizedBox(height: 20),
          CustomAppTextFormField(
            title: "Email Address",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
            textEditingController: TextEditingController(
              text: user.emailAddress,
            ),
            enable: false,
          ),
          const SizedBox(height: 20),
          CustomAppTextFormField(
            title: "Phone Number",
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone,
            textEditingController: TextEditingController(
              text: user.phoneNumber,
            ),
            enable: false,
          ),
          const SizedBox(height: 20),
          const BirthDateSelector(),
          const SizedBox(height: 20),
          Text(
            'Joined at ${user.joinedAt}',
            style: TextsStyle.textStyleMedium14.copyWith(
              color: AppColors.greyA7,
            ),
          ),
        ],
      ),
    );
  }
}
