import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';



class PrivacyPolicyBody extends StatelessWidget {
  const PrivacyPolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              CustomAppBar(
                appBarTitle: "Privacy Policy",
                onPressedLeft: () {
                  Navigator.pop(context);
                },
                leftIcon: Icons.arrow_back_ios_new_outlined,
              ),
              const SizedBox(height: 30.0),
              Text(
                "L15.1 Thank you for visiting our Application Doctor 24×7 and enrolling as a member.",
                style: TextsStyle.textStyleMedium14
                    .copyWith(color: AppColors.grey533),
              ),
              const SizedBox(height: 40),
              Text(
                "15.2 Your privacy is important to us. To better protect your privacy, we are providing this notice explaining our policy with regards to the information you share with us. This privacy policy relates to the information we collect, online from Application, received through the email, by fax or telephone, or in person or in any other way and retain and use for the purpose of providing you services. If you do not agree to the terms in this Policy, we kindly ask you not to use these portals and/or sign the contract document.",
                style: TextsStyle.textStyleMedium14
                    .copyWith(color: AppColors.grey533),
              ),
              const SizedBox(height: 40),
              Text(
                "15.3 In order to use the services of this Application, You are required to register yourself by verifying the authorised device. This Privacy Policy applies to your information that we collect and receive on and through Doctor 24×7; it does not apply to practices of businesses that we do not own or control or people we do not employ.",
                style: TextsStyle.textStyleMedium14
                    .copyWith(color: AppColors.grey533),
              ),
              const SizedBox(height: 40),
              Text(
                "15.4 By using this Application, you agree to the terms of this Privacy Policy.",
                style: TextsStyle.textStyleMedium14.copyWith(
                  color: AppColors.grey533,
                ),
              ),
            ],
      ),
    );
  }
}
