import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/images.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';
import '../../../../authentication/data/models/user_model.dart';
import '../../../../navigation_screen/logic/home_screen_cubit.dart';
import 'birth_date_selector.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenLoaded) {
          UserModel userModel = state.homeModel.userModel;
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
                  textEditingController: TextEditingController(
                    text: userModel.fullName,
                  ),
                  enable: false,
                ),
                const SizedBox(height: 20),
                CustomAppTextFormField(
                  title: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  textEditingController: TextEditingController(
                    text: userModel.emailAddress,
                  ),
                  enable: false,
                ),
                const SizedBox(height: 20),
                CustomAppTextFormField(
                  title: "Phone Number",
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone,
                  textEditingController: TextEditingController(
                    text: userModel.phoneNumber,
                  ),
                  enable: false,
                ),
                const SizedBox(height: 20),
                const BirthDateSelector(),
                const SizedBox(height: 20),
                Text(
                  'Joined at ${userModel.joinedAt}',
                  style: TextsStyle.textStyleMedium14.copyWith(
                    color: AppColors.greyA7,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.blue,
            ),
          );
        }
      },
    );
  }
}
