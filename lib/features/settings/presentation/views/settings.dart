import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubits/settings_cubit.dart';
import 'widgets/settings_view_body.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..getSettingsModel(),
      child: const Scaffold(
        body: SafeArea(
          child: SettingsViewBody(),
        ),
      ),
    );
  }
}
