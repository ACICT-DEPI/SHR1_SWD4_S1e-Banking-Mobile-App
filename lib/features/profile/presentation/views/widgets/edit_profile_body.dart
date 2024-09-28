import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/images.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/error_screen.dart';
import '../../../../authentication/data/models/user_model.dart';
import '../../../../navigation_screen/logic/home_screen_cubit.dart';
import '../../../domain/cubits/edit_user_cubit/edit_user_cubit.dart';
import '../../../domain/cubits/edit_user_cubit/edit_user_state.dart';
import 'birth_date_selector.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  bool enabled = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditUserCubit, EditUserState>(
      listener: (context, state) {
        if (state is EditUserSuccessState) {
          BlocProvider.of<HomeScreenCubit>(context).initialize();
          GoRouter.of(context).pop();
          buildShowSnackBar(context, "Profile edited successfully");
        }
      },
      builder: (context, editUserState) {
        return BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, homeState) {
            if (homeState is HomeScreenSuccess) {
              UserModel userModel = homeState.homeModel.userModel;
              nameController = TextEditingController(text: userModel.fullName);
              emailController =
                  TextEditingController(text: userModel.emailAddress);
              phoneController =
                  TextEditingController(text: userModel.phoneNumber);

              return Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomAppBar(
                      appBarTitle: "Edit Profile",
                      onPressedLeft: () {
                        Navigator.pop(context);
                      },
                      leftIcon: Icons.arrow_back_ios_new_outlined,
                      rightIcon: Icons.edit,
                      onPressedRight: () {
                        setState(() {
                          enabled = true;
                        });
                      },
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
                      textEditingController: nameController,
                      enable: enabled,
                    ),
                    const SizedBox(height: 20),
                    CustomAppTextFormField(
                      title: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      textEditingController: emailController,
                      enable: false,
                    ),
                    const SizedBox(height: 20),
                    CustomAppTextFormField(
                      title: "Phone Number",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone,
                      textEditingController: phoneController,
                      enable: enabled,
                    ),
                    const SizedBox(height: 20),
                    BirthDateSelector(
                      enabled: enabled,
                      userModel: homeState.homeModel.userModel,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Joined at ${userModel.joinedAt}',
                      style: TextsStyle.textStyleMedium14.copyWith(
                        color: AppColors.greyA7,
                      ),
                    ),
                    if (enabled) ...[
                      const Spacer(flex: 1),
                      CustomAppButton(
                        title: "Save",
                        onPressed: () {
                          BlocProvider.of<EditUserCubit>(context).updateUser(
                            fullName: nameController.text,
                            phoneNumber: phoneController.text,
                            birthDay: userModel.birthDay!,
                            birthMonth: userModel.birthMonth!,
                            birthYear: userModel.birthYear!,
                          );
                        },
                      ),
                      const Spacer(flex: 2),
                    ]
                  ],
                ),
              );
            } else if (editUserState is EditUserFailedState) {
              return ErrorScreen(message: editUserState.errMessage);
            } else {
              return const LoadingScreen();
            }
          },
        );
      },
    );
  }
}
