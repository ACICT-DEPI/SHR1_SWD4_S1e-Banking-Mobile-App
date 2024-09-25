import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubits/get_cards_cubit/get_cards_cubit.dart';
import '../domain/cubits/service_cubit/service_cubit.dart';
import 'widgets/service_view_body.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ServiceCubit(),
        ),
        BlocProvider(
          create: (context) => GetCardsCubit()..getAllCards(),
        )
      ],
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ServiceViewBody(),
        ),
      ),
    );
  }
}
