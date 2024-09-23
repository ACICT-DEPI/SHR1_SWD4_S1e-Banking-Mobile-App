import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubits/edit_user_cubit/edit_user_cubit.dart';
import 'widgets/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditUserCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: EditProfileBody(),
        ),
      ),
    );
  }
}
