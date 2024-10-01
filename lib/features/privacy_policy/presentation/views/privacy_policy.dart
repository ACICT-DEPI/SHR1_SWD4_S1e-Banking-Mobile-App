import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import 'widgets/privacy_policy_body.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: PrivacyPolicyBody(),
      ),
    );
  }
}
