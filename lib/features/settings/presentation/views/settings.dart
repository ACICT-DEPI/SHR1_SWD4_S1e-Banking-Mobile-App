import 'package:flutter/material.dart';

import 'widgets/settings_view_body.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SettingsViewBody(),
      ),
    );
  }
}
