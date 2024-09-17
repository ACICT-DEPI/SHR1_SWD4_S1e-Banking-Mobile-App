import 'package:bank_app/features/authentication/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../domain/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../../domain/cubits/sign_up_cubit/sign_up_state.dart';
import 'already_have_account_row.dart';
import 'sign_up_fields.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool isObscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          isLoading = true;
        } else if (state is SignUpFailureState) {
          buildShowSnackBar(context, state.errMessage);
          isLoading = false;
        } else if (state is SignUpSuccessState) {
          Navigator.pop(context);
          buildShowSnackBar(context, 'The email created successfully');
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.lightBlue,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CustomAppIconButton(
                    icon: Icons.arrow_back_ios_new_outlined,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 55),
                  const Text("Sign Up", style: TextsStyle.textStyleMedium32),
                  const SizedBox(height: 40),
                  SignUpFields(
                    nameTextController: nameTextController,
                    phoneTextController: phoneTextController,
                    emailTextController: emailTextController,
                    passwordTextController: passwordTextController,
                  ),
                  CustomAppButton(
                    title: "Sign Up",
                    onPressed: () {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context).userRegister(
                            user: UserModel(
                              fullName: nameTextController.text,
                              phoneNumber: phoneTextController.text,
                              emailAddress: emailTextController.text,
                              password: passwordTextController.text,
                            ),
                          );
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  const AlreadyHaveAccountRow()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
