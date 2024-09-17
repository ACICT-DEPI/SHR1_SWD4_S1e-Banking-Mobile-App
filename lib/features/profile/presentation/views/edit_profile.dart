import 'package:flutter/material.dart';

import '../../../authentication/data/models/user_model.dart';
import 'widgets/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EditProfileBody(
          user: user,
        ),
      ),
    );
  }
}
