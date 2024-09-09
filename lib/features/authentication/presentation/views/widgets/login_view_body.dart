import 'package:bank_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_app_icon_button.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              const CustomAppTextFormField(
                title: "Email Address",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 22),
              CustomAppTextFormField(
                title: "Password",
                prefixIcon: Icons.lock_outline,
                obscureText: isObscureText,
                suffixIcon: Icons.remove_red_eye_outlined,
                keyboardType: TextInputType.emailAddress,
                onPressedIcon: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
              ),
              const SizedBox(height: 40),
              CustomAppButton(
                title: "Sign In",
                onPressed: () {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                    if (formKey.currentState!.validate()) {
                      navigateHomeView(context);
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
    );
  }

  void navigateHomeView(BuildContext context) {
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeView(),
      ),
    );
  }
}
