import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubits/change_password_cubit/change_password_cubit.dart';
import 'widgets/change_password_body.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: ChangePasswordBody(),
        ),
      ),
    );
  }
}
