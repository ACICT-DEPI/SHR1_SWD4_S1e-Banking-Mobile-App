import 'package:flutter/material.dart';

import '../../../authentication/data/models/user_model.dart';
import 'widgets/settings_view_body.dart';

class Setting extends StatelessWidget {
  const Setting({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SettingsViewBody(
          user: user,
        ),
      ),
    );
  }
}
