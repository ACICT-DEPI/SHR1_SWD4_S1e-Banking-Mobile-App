import 'package:bank_app/features/privacy_policy/presentation/views/widgets/privacy_policy_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

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
