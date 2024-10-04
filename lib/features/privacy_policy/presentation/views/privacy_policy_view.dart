import 'package:flutter/material.dart';

import 'widgets/privacy_policy_view_body.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PrivacyPolicyViewBody(),
      ),
    );
  }
}
