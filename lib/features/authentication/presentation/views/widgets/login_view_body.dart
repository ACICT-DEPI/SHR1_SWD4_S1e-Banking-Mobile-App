import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/Routing/Routing.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../domain/cubits/login_cubit/login_cubit.dart';
import '../../../domain/cubits/login_cubit/login_state.dart';
import 'login_email_and_password.dart';
import 'new_user_row.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginFailureState) {
          isLoading = false;
          buildShowSnackBar(context, state.errMessage);
        } else if (state is LoginSuccessState) {
          isLoading = false;
          navigateHomeView(context);
          buildShowSnackBar(context, 'Welcome ${state.user.emailAddress}');
        }
      },
      builder: (context, state) => ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.lightBlue,
        ),
        inAsyncCall: isLoading,
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
                  const Text("Sign In", style: TextsStyle.textStyleMedium32),
                  const SizedBox(height: 40),
                  LoginEmailAndPassword(
                    emailTextController: emailTextController,
                    passwordTextController: passwordTextController,
                  ),
                  CustomAppButton(
                    title: "Sign In",
                    onPressed: () {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).userLogin(
                            email: emailTextController.text,
                            password: passwordTextController.text,
                          );
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  const NewUserRow()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateHomeView(BuildContext context) {
    while (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    }
    GoRouter.of(context).push(Routing.navigationScreen);
  }
}
