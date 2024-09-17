import 'package:flutter/material.dart';

import '../../../authentication/data/models/user_model.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProfileViewBody(
          user: user,
        ),
      ),
    );
  }
}
