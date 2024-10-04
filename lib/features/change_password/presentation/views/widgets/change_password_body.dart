import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/network/firebase_authentication.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/error_screen.dart';
import '../../../../../generated/l10n.dart';
import '../../../../authentication/data/models/user_model.dart';
import '../../../domain/cubits/change_password_cubit/change_password_cubit.dart';
import '../../../domain/cubits/change_password_cubit/change_password_state.dart';
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

  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          buildShowSnackBar(
            context,
            S.of(context).PasswordChangedSuccessfully,
          );
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is ChangePasswordFailedState) {
          return ErrorScreen(message: state.errMessage);
        } else if (state is ChangePasswordLoadingState) {
          return const LoadingScreen();
        } else {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            child: Form(
              autovalidateMode: autoValidate,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    appBarTitle: S.of(context).ChangePassword,
                    onPressedLeft: () {
                      Navigator.pop(context);
                    },
                    leftIcon: Icons.arrow_back_ios_new_outlined,
                  ),
                  const SizedBox(height: 50),
                  ChangePasswordWidget(
                    title: S.of(context).CurrentPassword,
                    textEditingController: currentPasswordController,
                  ),
                  const SizedBox(height: 30),
                  ChangePasswordWidget(
                    title: S.of(context).NewPassword,
                    textEditingController: newPasswordController,
                  ),
                  const SizedBox(height: 30),
                  ChangePasswordWidget(
                    title: S.of(context).ConfirmNewPassword,
                    textEditingController: confirmPasswordController,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).PasswordsMustMatch,
                    style: TextsStyle.textStyleMedium14.copyWith(
                      color: AppColors.greyA7,
                    ),
                  ),
                  const Spacer(),
                  CustomAppButton(
                    title: S.of(context).ChangePassword,
                    onPressed: () async {
                      autoValidate = AutovalidateMode.always;
                      if (formKey.currentState!.validate()) {
                        if (await checkOldPassword()) {
                          if (matchNewPasswords()) {
                            showDialog(
                              context: context,
                              builder: (context2) => CustomDialog(
                                dialogTitle:
                                    "${S.of(context).Save} ${S.of(context).Password}",
                                dialogSubText: S.of(context).AreYouSure,
                                onSubmit: () {
                                  BlocProvider.of<ChangePasswordCubit>(context)
                                      .updatePassword(
                                    newPasswordController.text,
                                  );
                                },
                                onCancel: () {},
                                onSubmitText: S.of(context).Save,
                                onCancelText: S.of(context).Cancel,
                              ),
                            );
                          } else {
                            buildShowSnackBar(
                              context,
                              S.of(context).NewPasswordsMustMatch,
                            );
                          }
                        } else {
                          buildShowSnackBar(
                            context,
                            S.of(context).EnterCorrectPassword,
                          );
                        }
                      }
                    },
                  ),
                  const Spacer(flex: 5),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  bool matchNewPasswords() {
    return newPasswordController.text == confirmPasswordController.text;
  }

  Future<bool> checkOldPassword() async {
    return currentPasswordController.text == await getUserPassword();
  }

  Future<String> getUserPassword() async {
    UserModel userModel = await FirebaseAuthentication.getUserModel();
    return userModel.password;
  }
}
